package com.todo.model;

import java.util.ArrayList;
import java.util.List;

public class ItemList {
  private List<Item> items = new ArrayList<Item>();

  public List<Item> getItems() { return items; }

  public void setItems(List<Item> items) { this.items = items; }

  public void addItem(Item newItem) {
    this.items.add(newItem);
  }

  public Item findItem(int id) { return this.items.get(id); }

  public int sizeOf() { return this.items.size(); }

  public void updateItem(int id, Item targetItem) {
    this.items.set(id, targetItem);
  }

  public void deleteItem(int id) {
    if (this.items.size() >= id) {
      this.items.remove(id);
    }
  }
}
