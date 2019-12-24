package com.tx.web.rest;

import com.tx.JtxApp;
import com.tx.domain.Catalog;
import com.tx.repository.CatalogRepository;
import com.tx.service.CatalogService;
import com.tx.web.rest.errors.ExceptionTranslator;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Validator;

import javax.persistence.EntityManager;
import java.util.List;

import static com.tx.web.rest.TestUtil.createFormattingConversionService;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Integration tests for the {@link CatalogResource} REST controller.
 */
@SpringBootTest(classes = JtxApp.class)
public class CatalogResourceIT {

    private static final String DEFAULT_TYPE = "AAAAAAAAAA";
    private static final String UPDATED_TYPE = "BBBBBBBBBB";

    private static final String DEFAULT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_NAME = "BBBBBBBBBB";

    @Autowired
    private CatalogRepository catalogRepository;

    @Autowired
    private CatalogService catalogService;

    @Autowired
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

    @Autowired
    private PageableHandlerMethodArgumentResolver pageableArgumentResolver;

    @Autowired
    private ExceptionTranslator exceptionTranslator;

    @Autowired
    private EntityManager em;

    @Autowired
    private Validator validator;

    private MockMvc restCatalogMockMvc;

    private Catalog catalog;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.initMocks(this);
        final CatalogResource catalogResource = new CatalogResource(catalogService);
        this.restCatalogMockMvc = MockMvcBuilders.standaloneSetup(catalogResource)
            .setCustomArgumentResolvers(pageableArgumentResolver)
            .setControllerAdvice(exceptionTranslator)
            .setConversionService(createFormattingConversionService())
            .setMessageConverters(jacksonMessageConverter)
            .setValidator(validator).build();
    }

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Catalog createEntity(EntityManager em) {
        Catalog catalog = new Catalog()
            .type(DEFAULT_TYPE)
            .name(DEFAULT_NAME);
        return catalog;
    }
    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Catalog createUpdatedEntity(EntityManager em) {
        Catalog catalog = new Catalog()
            .type(UPDATED_TYPE)
            .name(UPDATED_NAME);
        return catalog;
    }

    @BeforeEach
    public void initTest() {
        catalog = createEntity(em);
    }

    @Test
    @Transactional
    public void createCatalog() throws Exception {
        int databaseSizeBeforeCreate = catalogRepository.findAll().size();

        // Create the Catalog
        restCatalogMockMvc.perform(post("/api/catalogs")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(catalog)))
            .andExpect(status().isCreated());

        // Validate the Catalog in the database
        List<Catalog> catalogList = catalogRepository.findAll();
        assertThat(catalogList).hasSize(databaseSizeBeforeCreate + 1);
        Catalog testCatalog = catalogList.get(catalogList.size() - 1);
        assertThat(testCatalog.getType()).isEqualTo(DEFAULT_TYPE);
        assertThat(testCatalog.getName()).isEqualTo(DEFAULT_NAME);
    }

    @Test
    @Transactional
    public void createCatalogWithExistingId() throws Exception {
        int databaseSizeBeforeCreate = catalogRepository.findAll().size();

        // Create the Catalog with an existing ID
        catalog.setId(1L);

        // An entity with an existing ID cannot be created, so this API call must fail
        restCatalogMockMvc.perform(post("/api/catalogs")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(catalog)))
            .andExpect(status().isBadRequest());

        // Validate the Catalog in the database
        List<Catalog> catalogList = catalogRepository.findAll();
        assertThat(catalogList).hasSize(databaseSizeBeforeCreate);
    }


    @Test
    @Transactional
    public void checkTypeIsRequired() throws Exception {
        int databaseSizeBeforeTest = catalogRepository.findAll().size();
        // set the field null
        catalog.setType(null);

        // Create the Catalog, which fails.

        restCatalogMockMvc.perform(post("/api/catalogs")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(catalog)))
            .andExpect(status().isBadRequest());

        List<Catalog> catalogList = catalogRepository.findAll();
        assertThat(catalogList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void checkNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = catalogRepository.findAll().size();
        // set the field null
        catalog.setName(null);

        // Create the Catalog, which fails.

        restCatalogMockMvc.perform(post("/api/catalogs")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(catalog)))
            .andExpect(status().isBadRequest());

        List<Catalog> catalogList = catalogRepository.findAll();
        assertThat(catalogList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void getAllCatalogs() throws Exception {
        // Initialize the database
        catalogRepository.saveAndFlush(catalog);

        // Get all the catalogList
        restCatalogMockMvc.perform(get("/api/catalogs?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(catalog.getId().intValue())))
            .andExpect(jsonPath("$.[*].type").value(hasItem(DEFAULT_TYPE)))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)));
    }
    
    @Test
    @Transactional
    public void getCatalog() throws Exception {
        // Initialize the database
        catalogRepository.saveAndFlush(catalog);

        // Get the catalog
        restCatalogMockMvc.perform(get("/api/catalogs/{id}", catalog.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.id").value(catalog.getId().intValue()))
            .andExpect(jsonPath("$.type").value(DEFAULT_TYPE))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME));
    }

    @Test
    @Transactional
    public void getNonExistingCatalog() throws Exception {
        // Get the catalog
        restCatalogMockMvc.perform(get("/api/catalogs/{id}", Long.MAX_VALUE))
            .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateCatalog() throws Exception {
        // Initialize the database
        catalogService.save(catalog);

        int databaseSizeBeforeUpdate = catalogRepository.findAll().size();

        // Update the catalog
        Catalog updatedCatalog = catalogRepository.findById(catalog.getId()).get();
        // Disconnect from session so that the updates on updatedCatalog are not directly saved in db
        em.detach(updatedCatalog);
        updatedCatalog
            .type(UPDATED_TYPE)
            .name(UPDATED_NAME);

        restCatalogMockMvc.perform(put("/api/catalogs")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(updatedCatalog)))
            .andExpect(status().isOk());

        // Validate the Catalog in the database
        List<Catalog> catalogList = catalogRepository.findAll();
        assertThat(catalogList).hasSize(databaseSizeBeforeUpdate);
        Catalog testCatalog = catalogList.get(catalogList.size() - 1);
        assertThat(testCatalog.getType()).isEqualTo(UPDATED_TYPE);
        assertThat(testCatalog.getName()).isEqualTo(UPDATED_NAME);
    }

    @Test
    @Transactional
    public void updateNonExistingCatalog() throws Exception {
        int databaseSizeBeforeUpdate = catalogRepository.findAll().size();

        // Create the Catalog

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restCatalogMockMvc.perform(put("/api/catalogs")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(catalog)))
            .andExpect(status().isBadRequest());

        // Validate the Catalog in the database
        List<Catalog> catalogList = catalogRepository.findAll();
        assertThat(catalogList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    public void deleteCatalog() throws Exception {
        // Initialize the database
        catalogService.save(catalog);

        int databaseSizeBeforeDelete = catalogRepository.findAll().size();

        // Delete the catalog
        restCatalogMockMvc.perform(delete("/api/catalogs/{id}", catalog.getId())
            .accept(TestUtil.APPLICATION_JSON_UTF8))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        List<Catalog> catalogList = catalogRepository.findAll();
        assertThat(catalogList).hasSize(databaseSizeBeforeDelete - 1);
    }

    @Test
    @Transactional
    public void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(Catalog.class);
        Catalog catalog1 = new Catalog();
        catalog1.setId(1L);
        Catalog catalog2 = new Catalog();
        catalog2.setId(catalog1.getId());
        assertThat(catalog1).isEqualTo(catalog2);
        catalog2.setId(2L);
        assertThat(catalog1).isNotEqualTo(catalog2);
        catalog1.setId(null);
        assertThat(catalog1).isNotEqualTo(catalog2);
    }
}
