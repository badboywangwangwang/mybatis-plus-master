package com.gan.commonn;

import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Wang
 * @since 2022/1/23
 */
public class ResultUtils {
    /**
     * 分页查询的返回结果
     */
    public static Result<Map<String, Object>> buildPageResult(IPage<?> page) {
        Map<String, Object> data = new HashMap<>();
        data.put("count", page.getTotal());
        data.put("records", page.getRecords());
        return Result.success(data);
    }

    /**
     * 相应信息
     */
    public static Result<String> buildResult(boolean isSuccess) {
        if (isSuccess) {
            return Result.success(null);
        }
        return Result.failed("操作失败");
    }
}
