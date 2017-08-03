package com.todo.controller;

import com.todo.model.Item;
import com.todo.model.ItemList;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("items")
public class MainController {

  @RequestMapping("/")
  public String index(ModelMap model) {
    if (!model.containsAttribute("items")) {
      model.addAttribute("items", new ItemList());
    }
    System.out.println("this is items" + model.get("items"));
    return "index";
  }

  @GetMapping("/newItem")
  public String goToNewItem(@ModelAttribute ("item") Item item) {
    return "newItem";
  }

  @PostMapping("/newItem")
  public ModelAndView newItem(@ModelAttribute ("item") Item item, ModelMap model) {
    ModelAndView mav = new ModelAndView();
    ItemList currentList = (ItemList)model.get("items");
    currentList.addItem(item);
    mav.setViewName("index");
    System.out.println("This is currentList" + currentList.getItems());
    return mav;
  }

  @GetMapping("/update/{id}")
  public ModelAndView updateItemForm(@ModelAttribute ("item") Item item, @PathVariable("id") Integer itemId, ModelMap model) {
    System.out.println("hello");
    ModelAndView mav = new ModelAndView();
    ItemList currentList = (ItemList)model.get("items");
    Item targetItem = currentList.findItem(itemId);
    model.addAttribute("item", targetItem);
    mav.addObject(model);
    mav.setViewName("newItem");
    return mav;
  }

  @PostMapping("/update/{id}")
  public String updateItem(@PathVariable("id") Integer itemId, @ModelAttribute ("item") Item item, ModelMap model) {
    ItemList currentList = (ItemList)model.get("items");
    currentList.updateItem(itemId, item);
    return "index";
  }

  @RequestMapping(value = "/finish", method = RequestMethod.POST)
  public ResponseEntity finishItem(@RequestParam int itemId, ModelMap model) {
    System.out.println("Hi, this is controller. This is id " + itemId);
    ItemList currentList = (ItemList)model.get("items");
    currentList.deleteItem(itemId);
    System.out.println("delete successfully");
    return new ResponseEntity(true, HttpStatus.OK);
  }

  @GetMapping("/delete/{id}")
  public String deleteItem(@PathVariable("id") Integer itemId, ModelMap model) {
    return "index";
  }
}
