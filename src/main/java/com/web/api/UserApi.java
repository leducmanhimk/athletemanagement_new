package com.web.api;

import com.web.dto.*;
import com.web.entity.User;
import com.web.exception.MessageException;
import com.web.jwt.JwtTokenProvider;
import com.web.repository.UserRepository;
import com.web.utils.MailService;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/user")
@CrossOrigin("*")
public class UserApi {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private MailService mailService;


    @PostMapping("/public/login")
    public TokenDto authenticate(@RequestBody LoginDto loginDto) {
        Optional<User> users = userRepository.findByEmailAndPassword(loginDto.getEmail(), loginDto.getPassword());
        if(users.isEmpty()){
            throw new MessageException("Tài khoản hoặc mật khẩu không chính xác");
        }
        if(users.get().getActived() == false){
            throw new MessageException("Tài khoản đã bị khóa");
        }
        CustomUserDetails customUserDetails = new CustomUserDetails(users.get());
        String token = jwtTokenProvider.generateToken(customUserDetails);
        TokenDto tokenDto = new TokenDto();
        tokenDto.setToken(token);
        tokenDto.setUser(users.get());
        return tokenDto;
    }

    @PostMapping("/admin/create")
    public User addUser(@RequestBody User user){
        Optional<User> us = userRepository.findByEmail(user.getEmail());
        if(us.isPresent()){
            throw new MessageException("Email đã được sử dụng");
        }
        user.setCreatedDate(new Date(System.currentTimeMillis()));
        user.setActived(true);
        String randompass = userUtils.randomPass();
        user.setPassword(randompass);
        mailService.sendEmail(user.getEmail(), "Mật khẩu tài khoản","Xử dụng email: "+user.getEmail()+" để đăng nhập<br>" +
                "Đây là mật khẩu của bạn, không được chia sẻ với bất kỳ ai<br><br>" +
                "<a style=\"background-color: #2f5fad; padding: 10px; color: #fff; font-size: 18px; font-weight: bold;\">"+user.getPassword()+"</a>",false, true);
        return userRepository.save(user);
    }

    @PostMapping("/admin/update")
    public User updateAccount(@RequestBody User user){
        User us = userRepository.findById(user.getId()).get();
        Optional<User> ex = userRepository.findByEmailAndId(user.getEmail(), user.getId());
        if(ex.isPresent()){
            throw new MessageException("Email đã được sử dụng");
        }
        user.setCreatedDate(us.getCreatedDate());
        user.setActived(us.getActived());
        user.setPassword(us.getPassword());
        return userRepository.save(user);
    }

    @PostMapping("/all/change-password")
    public ResponseEntity<?> changePassword(@RequestBody PasswordDto passwordDto){
        User user = userUtils.getUserWithAuthority();
        if(!user.getPassword().equals(passwordDto.getOldPass())){
            throw new MessageException("Mật khẩu cũ không chính xác");
        }
        user.setPassword(passwordDto.getNewPass());
        userRepository.save(user);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    @PostMapping("/public/forgot-password")
    public ResponseEntity<?> changePassword(@RequestParam String email){
        Optional<User> user = userRepository.findByEmail(email);
        if(user.isEmpty()){
            throw new MessageException("Không tìm thấy tài khoản");
        }
        mailService.sendEmail(email, "Quên mật khẩu","Mật khẩu của bạn là:<br> "+
                "<a style=\"background-color: #2f5fad; padding: 10px; color: #fff; font-size: 18px; font-weight: bold;\">"+user.get().getPassword()+"</a>",false, true);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }


    @GetMapping("/admin/get-user-by-role")
    public ResponseEntity<?> getUserByRole(@RequestParam(value = "role", required = false) String role){
        List<User> list = null;
        if(role == null){
            list = userRepository.findAll();
        }
        else{
            list = userRepository.findByRole(role);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/admin/find-by-id")
    public ResponseEntity<?> findById(@RequestParam(value = "id") Long id){
        User user = userRepository.findById(id).get();
        return new ResponseEntity<>(user, HttpStatus.OK);
    }


    @PostMapping("/admin/lockOrUnlockUser")
    public void activeOrUnactiveUser(@RequestParam("id") Long id){
        User user = userRepository.findById(id).get();
        if(user.getActived() == true){
            user.setActived(false);
            userRepository.save(user);
            return;
        }
        else{
            user.setActived(true);
            userRepository.save(user);
        }
    }

    @DeleteMapping("/admin/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        try {
            userRepository.deleteById(id);
        }catch (Exception e){
            throw new MessageException("Tài khoản không thể xóa, hãy khóa tài khoản");
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }


    @GetMapping("/admin/check-role-admin")
    public void checkRoleAdmin(){
        System.out.println("admin");
    }

    @GetMapping("/coach/check-role-coach")
    public void checkRoleCoach(){
        System.out.println("coach");
    }

    @GetMapping("/expert/check-role-expert")
    public void checkRoleexpert(){
        System.out.println("expert");
    }

    @GetMapping("/athlete/check-role-athlete")
    public void checkroleAthlete(){
        System.out.println("expert");
    }

    @GetMapping("/user/check-role-user")
    public void checkRoleUser(){
        System.out.println("user");
    }

}
