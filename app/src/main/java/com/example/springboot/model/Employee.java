package com.example.springboot.model;

import javax.persistence.*;

@Entity
@Table(name = "employees")
public class Employee {

    // 物件屬性設定
    private long id;
    private String firstName;
    private String lastName;
    private String emailId;

    //
    public Employee(){
        this.firstName = "demo";
        this.lastName = "demo";
        this.emailId = "example@example.com";
    }

    // 初始建構子
    public Employee(String firstName, String lastName, String emailId){
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailId = emailId;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public long getId(){
        return id;
    }
    public void setId(long id){
        this.id = id;
    }

    // 設定first_name欄位的get set
    @Column(name = "first_name", nullable = false)
    public String getFirstName(){
        return firstName;
    }
    public void setFirstName(String firstName){
        this.firstName = firstName;
    }

    // 設定last_name欄位的get set
    @Column(name = "last_name", nullable = false)
    public String getLastName(){
        return lastName;
    }
    public void setLastName(String lastName){
        this.lastName = lastName;
    }

    // 設定email_address欄位的get set
    @Column(name = "email_address", nullable = false)
    public String getEmailId(){
        return emailId;
    }
    public void setEmailId(String emailId){
        this.emailId = emailId;
    }

}
