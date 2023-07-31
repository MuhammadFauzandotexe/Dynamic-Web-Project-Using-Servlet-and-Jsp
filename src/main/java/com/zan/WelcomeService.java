package com.zan;

import com.zan.entity.Student;

import java.util.HashMap;
import java.util.Map;

public class WelcomeService {

    public static Map<String, Map<String, Integer>> getStudentDataByDepartment() {
        Student student1 = new Student("S001", "Arya", "DEP001", 35);
        Student student2 = new Student("S002", "Ayu", "DEP001", 70);
        Student student3 = new Student("S003", "Adi", "DEP001", 60);
        Student student4 = new Student("S004", "Dimas", "DEP001", 90);
        Student student5 = new Student("S005", "Heru", "DEP002", 30);
        Student student6 = new Student("S006", "Jafar", "DEP003", 32);
        Student student7 = new Student("S007", "Fauzan", "DEP003", 70);
        Student student8 = new Student("S008", "Yova", "DEP003", 20);

        Map<String, Map<String, Integer>> studentDataByDepartment = new HashMap<>();
        putStudentData(studentDataByDepartment, student1);
        putStudentData(studentDataByDepartment, student2);
        putStudentData(studentDataByDepartment, student3);
        putStudentData(studentDataByDepartment, student4);
        putStudentData(studentDataByDepartment, student5);
        putStudentData(studentDataByDepartment, student6);
        putStudentData(studentDataByDepartment, student7);
        putStudentData(studentDataByDepartment, student8);
        return studentDataByDepartment;
    }

    private static void putStudentData(Map<String, Map<String, Integer>> studentDataByDepartment, Student student) {
        if (!studentDataByDepartment.containsKey(student.getDepartment())) {
            studentDataByDepartment.put(student.getDepartment(), new HashMap<>());
        }
        studentDataByDepartment.get(student.getDepartment()).put(student.getStudentID(), student.getMark());
    }
}
