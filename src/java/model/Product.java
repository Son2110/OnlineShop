/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author User
 */
public class Product {

    private String productId;
    private String productName;
    private String producImage;
    private String brief;
    private Date postDate;
    private Category type;
    private Account account;
    private String unit;
    private int price;
    private int discount;

    public Product() {
    }

    public Product(String productId, String productName, String producImage, String brief, Date postDate, Category type, Account account, String unit, int price, int discount) {
        this.productId = productId;
        this.productName = productName;
        this.producImage = producImage;
        this.brief = brief;
        this.postDate = postDate;
        this.type = type;
        this.account = account;
        this.unit = unit;
        this.price = price;
        this.discount = discount;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProducImage() {
        return producImage;
    }

    public void setProducImage(String producImage) {
        this.producImage = producImage;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public Category getType() {
        return type;
    }

    public void setType(Category type) {
        this.type = type;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

}
