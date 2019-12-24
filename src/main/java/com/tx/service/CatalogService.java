package com.tx.service;

import com.tx.domain.Catalog;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

/**
 * Service Interface for managing {@link Catalog}.
 */
public interface CatalogService {

    /**
     * Save a catalog.
     *
     * @param catalog the entity to save.
     * @return the persisted entity.
     */
    Catalog save(Catalog catalog);

    /**
     * Get all the catalogs.
     *
     * @param pageable the pagination information.
     * @return the list of entities.
     */
    Page<Catalog> findAll(Pageable pageable);


    /**
     * Get the "id" catalog.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    Optional<Catalog> findOne(Long id);

    /**
     * Delete the "id" catalog.
     *
     * @param id the id of the entity.
     */
    void delete(Long id);
}
