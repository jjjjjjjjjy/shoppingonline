package com.itheima.pojo;

import org.springframework.web.multipart.MultipartFile;

public class Goods {
    private int gid;
    private String gname;
    private double price;
    private String image;
    private int uid;
    private int amount;
    private int cart;
    private int consumer;
    private MultipartFile file;
    private  String category;

    public Goods() {
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public void setConsumer(int consumer) {
        this.consumer = consumer;
    }

    public int getConsumer() {
        return consumer;
    }

    public MultipartFile getFile() {
        return file;
    }
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public void setImage(String fileName) {
        this.image=fileName;
    }

    public String getImage() {
        return image;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getUid() {
        return uid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getGid() {
        return gid;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getAmount() {
        return amount;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGname() {
        return gname;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPrice() {
        return price;
    }

    public int getCart() {
        return cart;
    }

    public void setCart(int cart) {
        this.cart = cart;
    }
}
