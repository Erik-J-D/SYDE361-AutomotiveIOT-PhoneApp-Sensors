package com.example.ameya.syde361androidapp;

import android.location.Location;

import java.util.Date;
import io.realm.RealmObject;
import io.realm.annotations.Ignore;
import io.realm.annotations.PrimaryKey;

/**
 * Created by karan on 15-07-04.
 */
public class FuckUp extends RealmObject {

    @PrimaryKey
    private String what;
    private Date when;
    private Location where;

    // Getters
    public Date getDate() {return when;}
    public String getWhat() {return what;}
    public Location getWhere() {return where;}

    // Setters
    public void setDate(Date date) {this.when = date;}
    public void voidSetWhat(String what) {this.what = what;}
    public void voidSetWhere(Location where) {this.where = where;}
}
