package com.lzz.quartz;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class SampleJobService {

    private Logger logger = LoggerFactory.getLogger(getClass());

    public void executeSampleJob() {

        logger.info("★★★★★...");
        try {
            Thread.sleep(0);
        } catch (InterruptedException e) {
            logger.error("Error while executing sample job", e);
        } finally {
            logger.info("☆☆☆☆☆☆...");
        }
    }
}
