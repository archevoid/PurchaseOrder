package org.jicmu.order.member.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.jicmu.order.member.entity.Member;

@Data
@AllArgsConstructor
public class MemberDto {

    private Long userNum;
    private String username;
    private String userpw;
    private Integer privileged;
    private Boolean activation;


    public MemberDto(Member member) {
        this.userNum = member.getNum();
        this.username = member.getId();
        this.userpw = member.getPassword();
        this.privileged = member.getPrivileged();
        this.activation = member.getActivation();
    }


    public Member toEntity() {
        return new Member(userNum, username, userpw, privileged, activation);
    }


}
