package com.tx.service.impl;

import com.tx.service.CatalogService;
import com.tx.domain.Catalog;
import com.tx.repository.CatalogRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

/**
 * Service Implementation for managing {@link Catalog}.
 */
@Service
@Transactional
public class CatalogServiceImpl implements CatalogService {

    private final Logger log = LoggerFactory.getLogger(CatalogServiceImpl.class);

    private final CatalogRepository catalogRepository;

    public CatalogServiceImpl(CatalogRepository catalogRepository) {
        this.catalogRepository = catalogRepository;
    }

    /**
     * Save a catalog.
     *
     * @param catalog the entity to save.
     * @return the persisted entity.
     */
    @Override
    public Catalog save(Catalog catalog) {
        log.debug("Request to save Catalog : {}", catalog);
        return catalogRepository.save(catalog);
    }

    /**
     * Get all the catalogs.
     *
     * @param pageable the pagination information.
     * @return the list of entities.
     */
    @Override
    @Transactional(readOnly = true)
    public Page<Catalog> findAll(Pageable pageable) {
        log.debug("Request to get all Catalogs");
        return catalogRepository.findAll(pageable);
    }


    /**
     * Get one catalog by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Override
    @Transactional(readOnly = true)
    public Optional<Catalog> findOne(Long id) {
        log.debug("Request to get Catalog : {}", id);
        return catalogRepository.findById(id);
    }

    /**
     * Delete the catalog by id.
     *
     * @param id the id of the entity.
     */
    @Override
    public void delete(Long id) {
        log.debug("Request to delete Catalog : {}", id);
        catalogRepository.deleteById(id);
    }
}
