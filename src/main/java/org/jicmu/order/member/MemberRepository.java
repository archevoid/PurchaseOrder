package org.jicmu.order.member;


import org.jicmu.order.member.entity.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {

    Member save(Member member);

    Optional<Member> findByNum(Long num);

    List<Member> findAll();

    Member update(Member member);

}
