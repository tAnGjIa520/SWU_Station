package com.tangjia.pojo;

import java.math.BigDecimal;
import java.util.*;

public class Car {

    private Map<Integer,CarItem> itemsMap=new HashMap<Integer, CarItem>();




    public void addItem(CarItem item){
        CarItem carItem = itemsMap.get(item.getId());
        if (carItem==null){
            itemsMap.put(item.getId(),item);
        }else {
            carItem.setTotalItemCount(carItem.getTotalItemCount()+1);
            carItem.setTotalItemPrice(carItem.getItemPrice().multiply(new BigDecimal(carItem.getTotalItemCount())));

        }

    }

    public void deleteItem(Integer id){
        itemsMap.remove(id);
    }

    public void clearItems(){
        itemsMap.clear();
    }

    public void setItemCount(Integer id,Integer totalCount){
        CarItem carItem = this.itemsMap.get(id);

        if (carItem==null){

        }else {
            carItem.setTotalItemCount(totalCount);
            carItem.setTotalItemPrice(carItem.getItemPrice().multiply(new BigDecimal(carItem.getTotalItemCount())));
        }
    }

    public Car(Integer totalCount, BigDecimal totalPrice, Map<Integer, CarItem> itemsMap) {

        this.itemsMap = itemsMap;
    }

    public Car() {
    }

    public Integer getTotalCount() {
        Integer total=0;
        for (Map.Entry<Integer,CarItem> entry:itemsMap.entrySet()){
            total+=entry.getValue().getTotalItemCount();
        }
        return  total;
    }



    public BigDecimal getTotalPrice() {
        BigDecimal result = new BigDecimal(0);
        for (Map.Entry<Integer,CarItem> entry:itemsMap.entrySet()){

            result=result.add(entry.getValue().getTotalItemPrice());
        }
        return  result;
    }



    public Map<Integer, CarItem> getItemsMap() {
        return itemsMap;
    }

    public void setItemsMap(Map<Integer, CarItem> itemsMap) {
        this.itemsMap = itemsMap;
    }

    @Override
    public String toString() {
        return "Car{" +
                "itemsMap=" + itemsMap +
                '}';
    }
}
