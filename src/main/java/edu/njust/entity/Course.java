package edu.njust.entity;

public class Course {
    private int id;
    private String name;
    private int num;
    private String type;

    public Course() {
    }

    public Course(int id, String name, int num, String type) {
        super();
        this.setId(id);
        this.setName(name);
        this.setNum(num);
        this.setType(type);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
