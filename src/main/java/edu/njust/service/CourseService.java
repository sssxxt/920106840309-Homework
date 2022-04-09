package edu.njust.service;

public class CourseService {

    public CourseService() {

    }

    public int validateAddInfo(String num, String type) {

        char[] numArray = num.toCharArray();
        if (!type.equals("选修") && !type.equals("必修") && !type.equals("公选"))
            return 2;        //课程性质有误
        boolean flag = true;
        switch (type) {
            case "选修":
            case "必修":
            case "公选":
                break;
            default:
                flag = false;
        }
        if(!flag)
            return 2;
        else{
            for (char c : numArray) {
                if (c > '9' || c < '0')
                    return 1;
            }
        }        //选课人数有误
        return 0;
    }
}
