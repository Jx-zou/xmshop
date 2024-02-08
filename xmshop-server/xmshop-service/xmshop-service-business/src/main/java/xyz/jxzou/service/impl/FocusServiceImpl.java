package xyz.jxzou.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import xyz.jxzou.entity.Focus;
import xyz.jxzou.repository.FocusRepository;
import xyz.jxzou.service.FocusService;

/**
 * The type FocusServiceImpl.
 *
 * @author Jx-zou
 */
@Service
public class FocusServiceImpl implements FocusService {

    private final FocusRepository focusRepository;

    @Autowired
    public FocusServiceImpl(FocusRepository focusRepository) {
        this.focusRepository = focusRepository;
    }

    @Transactional
    @Override
    public Mono<Focus> add(Focus focus) {
        return focusRepository.save(focus);
    }

    @Override
    public Flux<Focus> findAll() {
        return focusRepository.findAll();
    }
}
