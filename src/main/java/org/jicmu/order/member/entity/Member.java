package org.jicmu.order.member.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "MEMBER")
@Getter @Setter @NoArgsConstructor @RequiredArgsConstructor @AllArgsConstructor
public class Member {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "num")
    private Long num;

    @NonNull @Column(name = "id") private String id;
    @NonNull @Column(name = "password") private String password;
    @NonNull @Column(name = "privileged") private Integer privileged;
    @NonNull @Column(name = "activation") private Boolean activation;

}
