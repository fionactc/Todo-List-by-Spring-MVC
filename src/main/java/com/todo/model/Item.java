package com.todo.model;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Item {
  @NotNull
  @Size(min=2)
  private String name;

  @NotNull
  private boolean isUrgent;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public boolean getIsUrgent() {
    return isUrgent;
  }

  public void setIsUrgent(boolean urgent) { isUrgent = urgent; }
}
