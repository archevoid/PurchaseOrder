package org.mettarche.order.member;


import org.mettarche.order.member.entity.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {

    Member save(Member member);

    Optional<Member> findByNum(Long num);

    List<Member> findAll();

}
