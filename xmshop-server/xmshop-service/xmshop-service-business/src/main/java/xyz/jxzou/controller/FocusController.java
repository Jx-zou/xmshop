package xyz.jxzou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;
import xyz.jxzou.common.pojo.ResponseResult;
import xyz.jxzou.entity.Focus;
import xyz.jxzou.service.FocusService;

import java.util.List;

/**
 * The type FocusController.
 *
 * @author Jx-zou
 */
@RestController
@RequestMapping("focus")
public class FocusController {

    private final FocusService focusService;

    @Autowired
    public FocusController(FocusService focusService) {
        this.focusService = focusService;
    }

    @GetMapping("list")
    public Mono<ResponseResult<List<Focus>>> getAllFocus() {
        return focusService.findAll().collectList().map(focusList -> new ResponseResult<>(200, "获取成功.", focusList));
    }
}
