package com.tx.domain.dto;


import com.tx.domain.OrderItem;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OrderDTO extends PageableDTO {

    private Long orderId;
    private Long orderItemId;
    private LocalDate orderDate;
    private String strOrderDate;
    private Long customerId;
    private String customerName;
    private Long productId;
    private String productName;
    private Integer invoiceStatus;
    private BigDecimal net;
    private BigDecimal shippingCost;
    private String note;
    private BigDecimal total;

    private LocalDate createdDate;
    private String strCreatedDate;
    private Long createdBy;
    private String createdByName;
    private LocalDate modifiedDate;
    private String strModifiedDate;
    private Long modifiedBy;
    private String modifiedByName;

    private List<OrderItem> items = new ArrayList<>();


    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Long orderItemId) {
        this.orderItemId = orderItemId;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public String getStrOrderDate() {
        return strOrderDate;
    }

    public void setStrOrderDate(String strOrderDate) {
        this.strOrderDate = strOrderDate;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getInvoiceStatus() {
        return invoiceStatus;
    }

    public void setInvoiceStatus(Integer invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }

    public BigDecimal getNet() {
        return net;
    }

    public void setNet(BigDecimal net) {
        this.net = net;
    }

    public BigDecimal getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(BigDecimal shippingCost) {
        this.shippingCost = shippingCost;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public String getStrCreatedDate() {
        return strCreatedDate;
    }

    public void setStrCreatedDate(String strCreatedDate) {
        this.strCreatedDate = strCreatedDate;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public String getCreatedByName() {
        return createdByName;
    }

    public void setCreatedByName(String createdByName) {
        this.createdByName = createdByName;
    }

    public LocalDate getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(LocalDate modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getStrModifiedDate() {
        return strModifiedDate;
    }

    public void setStrModifiedDate(String strModifiedDate) {
        this.strModifiedDate = strModifiedDate;
    }

    public Long getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(Long modifiedBy) {
        this.modifiedBy = modifiedBy;
    }


    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    public String getModifiedByName() {
        return modifiedByName;
    }

    public void setModifiedByName(String modifiedByName) {
        this.modifiedByName = modifiedByName;
    }

    public OrderDTO(Long orderId, Long orderItemId, LocalDate orderDate, String strOrderDate, Long customerId, String customerName, Long productId, String productName, Integer invoiceStatus, BigDecimal net, BigDecimal shippingCost, String note, BigDecimal total, LocalDate createdDate, String strCreatedDate, Long createdBy, LocalDate modifiedDate, String strModifiedDate, Long modifiedBy) {
        this.orderId = orderId;
        this.orderItemId = orderItemId;
        this.orderDate = orderDate;
        this.strOrderDate = strOrderDate;
        this.customerId = customerId;
        this.customerName = customerName;
        this.productId = productId;
        this.productName = productName;
        this.invoiceStatus = invoiceStatus;
        this.net = net;
        this.shippingCost = shippingCost;
        this.note = note;
        this.total = total;
        this.createdDate = createdDate;
        this.strCreatedDate = strCreatedDate;
        this.createdBy = createdBy;
        this.modifiedDate = modifiedDate;
        this.strModifiedDate = strModifiedDate;
        this.modifiedBy = modifiedBy;
    }

    @Override
    public String toString() {
        return "OrderDTO{" +
            "orderId=" + orderId +
            ", orderItemId=" + orderItemId +
            ", orderDate=" + orderDate +
            ", strOrderDate='" + strOrderDate + '\'' +
            ", customerId=" + customerId +
            ", customerName='" + customerName + '\'' +
            ", productId=" + productId +
            ", productName='" + productName + '\'' +
            ", invoiceStatus=" + invoiceStatus +
            ", net=" + net +
            ", shippingCost=" + shippingCost +
            ", note='" + note + '\'' +
            ", total=" + total +
            ", createdDate=" + createdDate +
            ", strCreatedDate='" + strCreatedDate + '\'' +
            ", createdBy=" + createdBy +
            ", createdByName='" + createdByName + '\'' +
            ", modifiedDate=" + modifiedDate +
            ", strModifiedDate='" + strModifiedDate + '\'' +
            ", modifiedBy=" + modifiedBy +
            ", modifiedByName='" + modifiedByName + '\'' +
            ", items=" + items +
            '}';
    }
}
