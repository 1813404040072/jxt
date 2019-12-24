package com.tx.domain;

import com.tx.domain.dto.OrderDTO;

import javax.persistence.*;
import javax.validation.constraints.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * A Order.
 */
@Entity
@Table(name = "tx_order")


@SqlResultSetMapping(name = "OrderDTOMapping",
    classes = @ConstructorResult(
        targetClass = OrderDTO.class,
        columns = {
            @ColumnResult(name = "orderId", type = Long.class),
            @ColumnResult(name = "orderItemId", type = Long.class),
            @ColumnResult(name = "orderDate", type = LocalDate.class),
            @ColumnResult(name = "strOrderDate", type = String.class),
            @ColumnResult(name = "customerId", type = Long.class),
            @ColumnResult(name = "customerName", type = String.class),
            @ColumnResult(name = "productId", type = Long.class),
            @ColumnResult(name = "productName", type = String.class),
            @ColumnResult(name = "invoiceStatus", type = Integer.class),
            @ColumnResult(name = "net", type = BigDecimal.class),
            @ColumnResult(name = "shippingCost", type = BigDecimal.class),
            @ColumnResult(name = "note", type = String.class),
            @ColumnResult(name = "total", type = BigDecimal.class),
            @ColumnResult(name = "createdDate", type = LocalDate.class),
            @ColumnResult(name = "strCreatedDate", type = String.class),
            @ColumnResult(name = "createdBy", type = Long.class),
            @ColumnResult(name = "modifiedDate", type = LocalDate.class),
            @ColumnResult(name = "strModifiedDate", type = String.class),
            //@ColumnResult(name = "createdByName", type = String.class),
            //@ColumnResult(name = "modifiedByName", type = String.class),
            @ColumnResult(name = "modifiedBy", type = Long.class)
        }
    )
)

public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id", nullable = false)
    private Long id;

    @NotNull
    @Column(name = "customer_id", nullable = false)
    private Long customerId;

    @Column(name = "order_date")
    private LocalDate orderDate;

    @Column(name = "invoice_status")
    private Integer invoiceStatus;

    @Column(name = "net", precision = 21, scale = 2)
    private BigDecimal net;

    @Column(name = "shipping_cost", precision = 21, scale = 2)
    private BigDecimal shippingCost;

    @Column(name = "note")
    private String note;

    @Column(name = "total", precision = 21, scale = 2)
    private BigDecimal total;

    @Column(name = "created_date")
    private LocalDate createdDate;

    @Column(name = "created_by")
    private Long createdBy;

    @Column(name = "modified_date")
    private LocalDate modifiedDate;

    @Column(name = "modified_by")
    private Long modifiedBy;

    @OneToMany(cascade = CascadeType.ALL,
        orphanRemoval = true,
        fetch = FetchType.EAGER)
    @JoinColumn(name = "order_id")
    private List<OrderItem> items = new ArrayList<>();

    // jhipster-needle-entity-add-field - JHipster will add fields here, do not remove
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public Order customerId(Long customerId) {
        this.customerId = customerId;
        return this;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public Order orderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
        return this;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getInvoiceStatus() {
        return invoiceStatus;
    }

    public Order invoiceStatus(Integer invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
        return this;
    }

    public void setInvoiceStatus(Integer invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }

    public BigDecimal getNet() {
        return net;
    }

    public Order net(BigDecimal net) {
        this.net = net;
        return this;
    }

    public void setNet(BigDecimal net) {
        this.net = net;
    }

    public BigDecimal getShippingCost() {
        return shippingCost;
    }

    public Order shippingCost(BigDecimal shippingCost) {
        this.shippingCost = shippingCost;
        return this;
    }

    public void setShippingCost(BigDecimal shippingCost) {
        this.shippingCost = shippingCost;
    }

    public String getNote() {
        return note;
    }

    public Order note(String note) {
        this.note = note;
        return this;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public Order total(BigDecimal total) {
        this.total = total;
        return this;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public Order createdDate(LocalDate createdDate) {
        this.createdDate = createdDate;
        return this;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public Order createdBy(Long createdBy) {
        this.createdBy = createdBy;
        return this;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public LocalDate getModifiedDate() {
        return modifiedDate;
    }

    public Order modifiedDate(LocalDate modifiedDate) {
        this.modifiedDate = modifiedDate;
        return this;
    }

    public void setModifiedDate(LocalDate modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public Long getModifiedBy() {
        return modifiedBy;
    }

    public Order modifiedBy(Long modifiedBy) {
        this.modifiedBy = modifiedBy;
        return this;
    }

    public void setModifiedBy(Long modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here, do not remove


    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Order)) {
            return false;
        }
        return id != null && id.equals(((Order) o).id);
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return "Order{" +
            "id=" + getId() +
            ", customerId=" + getCustomerId() +
            ", orderDate='" + getOrderDate() + "'" +
            ", invoiceStatus=" + getInvoiceStatus() +
            ", net=" + getNet() +
            ", shippingCost=" + getShippingCost() +
            ", note='" + getNote() + "'" +
            ", total=" + getTotal() +
            ", createdDate='" + getCreatedDate() + "'" +
            ", createdBy=" + getCreatedBy() +
            ", modifiedDate='" + getModifiedDate() + "'" +
            ", modifiedBy=" + getModifiedBy() +
            "}";
    }
}
