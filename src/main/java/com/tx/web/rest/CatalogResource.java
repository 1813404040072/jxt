package com.tx.web.rest;

import com.tx.domain.Catalog;
import com.tx.service.CatalogService;
import com.tx.web.rest.errors.BadRequestAlertException;

import io.github.jhipster.web.util.HeaderUtil;
import io.github.jhipster.web.util.PaginationUtil;
import io.github.jhipster.web.util.ResponseUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;

import java.util.List;
import java.util.Optional;

/**
 * REST controller for managing {@link com.tx.domain.Catalog}.
 */
@RestController
@RequestMapping("/api")
public class CatalogResource {

    private final Logger log = LoggerFactory.getLogger(CatalogResource.class);

    private static final String ENTITY_NAME = "catalog";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final CatalogService catalogService;

    public CatalogResource(CatalogService catalogService) {
        this.catalogService = catalogService;
    }

    /**
     * {@code POST  /catalogs} : Create a new catalog.
     *
     * @param catalog the catalog to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new catalog, or with status {@code 400 (Bad Request)} if the catalog has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("/catalogs")
    public ResponseEntity<Catalog> createCatalog(@Valid @RequestBody Catalog catalog) throws URISyntaxException {
        log.debug("REST request to save Catalog : {}", catalog);
        if (catalog.getId() != null) {
            throw new BadRequestAlertException("A new catalog cannot already have an ID", ENTITY_NAME, "idexists");
        }
        Catalog result = catalogService.save(catalog);
        return ResponseEntity.created(new URI("/api/catalogs/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, false, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    /**
     * {@code PUT  /catalogs} : Updates an existing catalog.
     *
     * @param catalog the catalog to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated catalog,
     * or with status {@code 400 (Bad Request)} if the catalog is not valid,
     * or with status {@code 500 (Internal Server Error)} if the catalog couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/catalogs")
    public ResponseEntity<Catalog> updateCatalog(@Valid @RequestBody Catalog catalog) throws URISyntaxException {
        log.debug("REST request to update Catalog : {}", catalog);
        if (catalog.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        Catalog result = catalogService.save(catalog);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, false, ENTITY_NAME, catalog.getId().toString()))
            .body(result);
    }

    /**
     * {@code GET  /catalogs} : get all the catalogs.
     *

     * @param pageable the pagination information.

     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of catalogs in body.
     */
    @GetMapping("/catalogs")
    public ResponseEntity<List<Catalog>> getAllCatalogs(Pageable pageable) {
        log.debug("REST request to get a page of Catalogs");
        Page<Catalog> page = catalogService.findAll(pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(ServletUriComponentsBuilder.fromCurrentRequest(), page);
        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }

    /**
     * {@code GET  /catalogs/:id} : get the "id" catalog.
     *
     * @param id the id of the catalog to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the catalog, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/catalogs/{id}")
    public ResponseEntity<Catalog> getCatalog(@PathVariable Long id) {
        log.debug("REST request to get Catalog : {}", id);
        Optional<Catalog> catalog = catalogService.findOne(id);
        return ResponseUtil.wrapOrNotFound(catalog);
    }

    /**
     * {@code DELETE  /catalogs/:id} : delete the "id" catalog.
     *
     * @param id the id of the catalog to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/catalogs/{id}")
    public ResponseEntity<Void> deleteCatalog(@PathVariable Long id) {
        log.debug("REST request to delete Catalog : {}", id);
        catalogService.delete(id);
        return ResponseEntity.noContent().headers(HeaderUtil.createEntityDeletionAlert(applicationName, false, ENTITY_NAME, id.toString())).build();
    }
}
