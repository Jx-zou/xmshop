package xyz.jxzou.service;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import xyz.jxzou.entity.Focus;

/**
 * The type FocusService.
 *
 * @author Jx-zou
 */
public interface FocusService {

    Mono<Focus> add(Focus focus);

    Flux<Focus> findAll();
}
