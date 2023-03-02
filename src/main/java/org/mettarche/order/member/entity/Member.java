package org.mettarche.order.member.entity;

import lombok.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Getter @Setter @NoArgsConstructor @RequiredArgsConstructor @AllArgsConstructor
public class Member {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long num;

    @NonNull private String id;
    @NonNull private String password;
    @NonNull private Integer privileged;
    @NonNull private Boolean activation;

}
