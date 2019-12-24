package com.tx.repository;

import com.tx.domain.Order;
import com.tx.domain.dto.OrderDTO;

import java.util.List;

public interface OrderRepositoryCustomer {

    List<OrderDTO> query(OrderDTO dto);
}
