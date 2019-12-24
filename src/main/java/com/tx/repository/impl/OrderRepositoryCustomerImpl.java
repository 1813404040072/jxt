package com.tx.repository.impl;

import com.tx.domain.dto.OrderDTO;
import com.tx.repository.OrderRepositoryCustomer;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

public class OrderRepositoryCustomerImpl implements OrderRepositoryCustomer {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<OrderDTO> query(OrderDTO dto) {
        String sqlSelect = "SELECT o.order_id as orderId, o.order_date as orderDate," +
            " o.invoice_status as invoiceStatus, " +
            " DATE_FORMAT(o.order_date, '%d/%m/%Y') as strOrderDate, "+
            " i.product_id as productId, i.order_item_id orderItemId," +
            " c.customer_id customerId, c.name customerName, p.name productName, " +
            " o.net, o.shipping_cost as shippingCost, o.note, o.total, " +
            " o.created_date createdDate, o.modified_date modifiedDate,  " +
            " DATE_FORMAT(o.created_date, '%d/%m/%Y') as strCreatedDate, "+
            " DATE_FORMAT(o.modified_date, '%d/%m/%Y') as strModifiedDate, "+
            " o.created_by createdBy, o.modified_by modifiedBy "+
            " FROM (SELECT * FROM tx_order ORDER BY order_id DESC LIMIT 0, 20) o  " +
            " INNER JOIN tx_order_item i ON o.order_id = i.order_id " +
            " INNER JOIN tx_customer c ON c.customer_id = o.customer_id " +
            " INNER JOIN tx_product p ON p.product_id = i.product_id  ORDER BY i.order_item_id DESC ";

        Query q = entityManager.createNativeQuery(sqlSelect, "OrderDTOMapping");
        List<OrderDTO> list = q.getResultList();
        System.out.println("size=>>>"+list.size());
        return list;
    }
}
