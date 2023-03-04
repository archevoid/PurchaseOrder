package org.mettarche.order.product.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PartDto {

    private Long partNum;
    private String partName;
    private ProductDto productDto;

}
