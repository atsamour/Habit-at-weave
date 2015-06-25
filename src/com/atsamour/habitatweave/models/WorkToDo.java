/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.atsamour.habitatweave.models;

//import java.beans.*;
import java.io.Serializable;
import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import static javax.persistence.TemporalType.TIMESTAMP;

/**
 *
 * @author AlariC
 */
@Entity
@Table(name = "worktodo")
public class WorkToDo implements Serializable {
   
    private static final long serialVersionUID = 74212443L;

    @Id
    @GeneratedValue
    private Integer id;

    @Column
    private String description;

    @Column
    private String command;
    
    @Column
    @Temporal(TIMESTAMP) 
    private Calendar dateToDo;
    
    @Column
    private Boolean done;

    public Boolean getDone() {
        return done;
    }

    public void setDone(Boolean done) {
        this.done = done;
    }

    public Calendar getDateToDo() {
        return dateToDo;
    }

    public void setDateToDo(Calendar dateToDo) {
        this.dateToDo = dateToDo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCommand() {
        return command;
    }

    public void setCommand(String command) {
        this.command = command;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public WorkToDo() {
    }
}
