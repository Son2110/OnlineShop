/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;

/**
 *
 * @author User
 */
public interface Accessible<T> {

    int insertRec(T o);

    int updateRec(T o);

    int deleteRec(T o);

    T getObjectById(String id);

    List<T> listAll();
}
