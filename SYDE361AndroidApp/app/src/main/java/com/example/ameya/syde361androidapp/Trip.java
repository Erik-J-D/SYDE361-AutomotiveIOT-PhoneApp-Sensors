package com.example.ameya.syde361androidapp;
import java.util.Date;
import com.example.ameya.syde361androidapp.FuckUp;
import io.realm.RealmObject;
import io.realm.RealmList;
import io.realm.annotations.Ignore;
import io.realm.annotations.PrimaryKey;

/**
 * Created by karan on 15-07-04.
 */
public class Trip extends RealmObject {

    @PrimaryKey
    private Date when;
    private RealmList<FuckUp> fuckUps;
    private double[] fuelEonomies;
    private boolean isCurrent;

    // Getters
    public Date getDate() {return when;}
    public RealmList<FuckUp> getFucksUps() {return fuckUps;}
    public double[] getFuelEonomies() {return fuelEonomies;}
    public boolean isCurrent() {return this.isCurrent;}

    // Setters
    public void setDate(Date date) {this.when = date;}
    public void addFuckUp(FuckUp newFuckUp) {this.fuckUps.add(newFuckUp);}
    public void addFuelEconomy(double newInstantFuelEcon) {this.fuelEonomies[this.fuelEonomies.length - 1] = newInstantFuelEcon;}

    public void startTrip() {this.isCurrent = true;}
    public void endTrip() {this.isCurrent = false;}
}
