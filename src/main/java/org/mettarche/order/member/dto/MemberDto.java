package org.mettarche.order.member.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.mettarche.order.member.entity.Member;

@Data
@AllArgsConstructor
public class MemberDto {

    private Long userNum;
    private String username;
    private String userpw;
    private Integer privileged;
    private Boolean activation;


    public Member toEntity() {
        return new Member(userNum, username, userpw, privileged, activation);
    }

}
