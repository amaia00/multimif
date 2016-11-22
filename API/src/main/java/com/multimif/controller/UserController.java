package com.multimif.controller;

import com.multimif.model.User;
import com.multimif.service.UserService;
import com.multimif.service.UserServiceImpl;
import com.multimif.util.Constantes;
import com.multimif.util.DataException;
import com.multimif.util.JsonUtil;
import com.multimif.util.Status;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


@RestController
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    @PostConstruct
    public void init() {
        userService = new UserServiceImpl();
    }

    private static final Logger LOGGER = Logger.getLogger(UserController.class.getName());

    @RequestMapping(value = "/", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<User> add(@RequestParam(value = "username") String username,
                                    @RequestParam(value = "mail") String mail,
                                    @RequestParam(value = "password") String password) {
        User user;

        try {
            user = userService.addEntity(mail, username, password);
        } catch (DataException ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } catch (Exception ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>(user, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{idUser}", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Status> modify(@PathVariable(value = "idUser") Long idUser,
                                       @RequestBody User user) {
        try {
            user.setIdUser(idUser);
            userService.updateEntity(user);
        } catch (DataException ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(new Status(Constantes.OPERATION_CODE_RATE,
                    Constantes.OPERATION_MSG_RATE),HttpStatus.NOT_FOUND);
        } catch (Exception ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(new Status(Constantes.OPERATION_CODE_RATE,
                    Constantes.OPERATION_MSG_RATE),HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>(new Status(Constantes.OPERATION_CODE_REUSSI,
                Constantes.OPERATION_MSG_REUSSI), HttpStatus.OK);
    }


    /* TODO the request method have to be par path ? */
    @RequestMapping(value = "/login", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<User> getByMail(@RequestParam(value = "username") String username,
                                          @RequestParam(value = "password") String password) {

        User user;

        try {
            user = userService.authEntity(username, password);
        } catch (Exception ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(user, HttpStatus.OK);
    }


    @RequestMapping(value = "/{idUser}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> getById(@PathVariable(value = "idUser") Long idUser) {
        User user;

        try {
            user = userService.getEntityById(idUser);
        } catch (DataException ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(JsonUtil.convertToJson(new Status(Constantes.OPERATION_CODE_RATE,
                    ex.getMessage())), HttpStatus.NOT_FOUND);
        } catch (Exception ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(JsonUtil.convertToJson(new Status(Constantes.OPERATION_CODE_RATE,
                    Constantes.OPERATION_MSG_RATE)), HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>(JsonUtil.convertToJson(user), HttpStatus.OK);
    }

    /* On ajout .+ étant donné que Spring par défaut ne reconnait pas le point */
    @RequestMapping(value = "/mail/{mail:.+}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> getByMail(@PathVariable(value = "mail") String mail) {
        User user;

        try {
            user = userService.getEntityByMail(mail);
        } catch (DataException ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(JsonUtil.convertToJson(new Status(Constantes.OPERATION_CODE_RATE,
                    ex.getMessage())), HttpStatus.NOT_FOUND);
        } catch (Exception ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(JsonUtil.convertToJson(new Status(Constantes.OPERATION_CODE_RATE,
                    Constantes.OPERATION_MSG_RATE)), HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>(JsonUtil.convertToJson(user), HttpStatus.OK);
    }


    @RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<List<User>> getAll() {
        List<User> users;

        try {
            users = userService.getEntityList();
        } catch (DataException ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } catch (Exception ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @RequestMapping(value = "/{idUser}", produces = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseEntity<Status> remove(@PathVariable(value = "idUser") Long idUser) {

        try {
            userService.deleteEntity(idUser);
        } catch (DataException ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(new Status(Constantes.OPERATION_CODE_RATE,
                    ex.getMessage()), HttpStatus.NOT_FOUND);
        } catch (Exception ex) {
            LOGGER.log(Level.FINE, ex.toString(), ex);
            return new ResponseEntity<>(new Status(Constantes.OPERATION_CODE_RATE,
                    Constantes.OPERATION_MSG_RATE), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(new Status(Constantes.OPERATION_CODE_REUSSI,
                Constantes.OPERATION_MSG_REUSSI), HttpStatus.OK);
    }

}
