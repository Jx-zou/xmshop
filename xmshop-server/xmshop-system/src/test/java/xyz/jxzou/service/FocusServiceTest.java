package xyz.jxzou.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import xyz.jxzou.entity.Focus;

import java.util.ArrayList;
import java.util.List;

/**
 * The type FocusServiceTest.
 *
 * @author Jx-zou
 */
@SpringBootTest
public class FocusServiceTest {

    @Autowired
    private FocusService focusService;

    private final List<String> focuses = List.of("0ef3268de51326ccabacab67b0593582.jpg", "Redmi Note 13新春版", "1e125f7e065bb9d7bc36b480a4437820.webp", "Redmi Watch4", "2e8f6ccc6a942648252e4f53131c2a01.webp", "小米路由器 be3600", "72d2f359aa032bc5f6372b3022b39a92.webp", "Redmi Buds 5 Pro", "b20d1741dd92cb32b387023ae6244838.webp", "米家保温杯 Ti 2");

    @Test
    public void insert() {
        List<Focus> focusList = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            Focus focus = new Focus();
            focus.setPic(focuses.get(i * 2));
            focus.setUrl(String.valueOf(i));
            focus.setPosition(i);
            focus.setTitle(focuses.get(i * 2 + 1));
            focusList.add(focus);
        }
        for (Focus focus : focusList) {
            focusService.add(focus);
        }
    }
}
