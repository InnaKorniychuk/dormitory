package com.example.dormitory.services;

import com.example.dormitory.models.Image;
import com.example.dormitory.models.Information;
import com.example.dormitory.models.User;
import com.example.dormitory.repositories.InformationRepository;
import com.example.dormitory.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class InformationService {
    private final InformationRepository informationRepository;
    private final UserRepository userRepository;
    public List<Information>listInformation(String nameDormitory){
        if(nameDormitory!=null) return informationRepository.findByNameDormitory(nameDormitory);
        return  informationRepository.findAll();
    }

    public void saveInfo(Principal principal,Information info, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        info.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;

        if(file1.getSize()!=0){
            image1= toImageEntity(file1);
            image1.setPreviewImage(true);
            info.addImageToInfo(image1);
        }
        if(file2.getSize()!=0){
            image2= toImageEntity(file2);
            info.addImageToInfo(image2);
        }
        if(file3.getSize()!=0){
            image3= toImageEntity(file3);
            info.addImageToInfo(image3);
        }
        log.info("Saving new request. Dormitory name: {}; Author email: {}",info.getUser().getEmail());
        Information infoFromDb=informationRepository.save(info);
        informationRepository.save(info);
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal== null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteInformation(Long id){
        informationRepository.deleteById(id);
    }

    public Information getInfoById(Long id) {
      return  informationRepository.findById(id).orElse(null);
    }
}
