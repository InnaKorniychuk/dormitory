package com.example.dormitory.controllers;

import com.example.dormitory.models.Information;
import org.springframework.ui.Model;
import com.example.dormitory.services.InformationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class DormitoryController {
    private final InformationService informationService;
    @GetMapping("/")
    public String information(@RequestParam(name="nameDormitory", required = false) String nameDormitory, Principal principal,Model model){
        model.addAttribute("information",informationService.listInformation(nameDormitory));
        model.addAttribute("user", informationService.getUserByPrincipal(principal));
        return "information";
    }

    @GetMapping("/info/{id}")
    public String allInfo(@PathVariable Long id, Model model){
        Information info= informationService.getInfoById(id);
        model.addAttribute("info",info);
       model.addAttribute("images",info.getImages());
        return "single-info";
    }

    @PostMapping("/info/create")
    public String createInfo(@RequestParam("file1") MultipartFile file1,
                             @RequestParam("file2") MultipartFile file2,
                             @RequestParam("file3") MultipartFile file3, Information info
                             ,Principal principal) throws IOException {
        informationService.saveInfo(principal,info,file1,file2,file3);
        return "redirect:/";
    }

    @PostMapping("/info/delete/{id}")
    public String deleteInfo(@PathVariable Long id){
        informationService.deleteInformation(id);
        return "redirect:/";
    }
}
