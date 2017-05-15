package com.liyingyu.entity;

import java.io.FileReader;

/**
 * Created by YingyuLi on 2017/5/2.
 */
public class FishingPlace {
    private double longitude;
    private double latitude;
    private String fishing_place_name;
    private String species_of_fish;
    private String free_or_not;
    private String discoverer_name;
    private double score;

    public FishingPlace(){}

    public FishingPlace(double longitude, double latitude, String fishing_place_name, String species_of_fish, String free_or_not, String discoverer_name, double score) {
        this.longitude = longitude;
        this.latitude = latitude;
        this.fishing_place_name = fishing_place_name;
        this.species_of_fish = species_of_fish;
        this.free_or_not = free_or_not;
        this.discoverer_name = discoverer_name;
        this.score = score;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public String getFishing_place_name() {
        return fishing_place_name;
    }

    public void setFishing_place_name(String fishing_place_name) {
        this.fishing_place_name = fishing_place_name;
    }

    public String getSpecies_of_fish() {
        return species_of_fish;
    }

    public void setSpecies_of_fish(String species_of_fish) {
        this.species_of_fish = species_of_fish;
    }

    public String isFree_or_not() {
        return free_or_not;
    }

    public void setFree_or_not(String free_or_not) {
        this.free_or_not = free_or_not;
    }

    public String getDiscoverer_name() {
        return discoverer_name;
    }

    public void setDiscoverer_name(String discoverer_name) {
        this.discoverer_name = discoverer_name;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
