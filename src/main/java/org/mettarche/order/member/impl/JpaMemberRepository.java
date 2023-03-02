package org.mettarche.order.member.impl;

import lombok.RequiredArgsConstructor;
import org.mettarche.order.member.MemberRepository;
import org.mettarche.order.member.entity.Member;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Optional;


@Repository
@RequiredArgsConstructor
public class JpaMemberRepository implements MemberRepository {

    private final EntityManager em;


    @Override
    public Member save(Member member) {
        em.persist(member);

        return member;
    }

    @Override
    public Optional<Member> findByNum(Long num) {
        return Optional.ofNullable(em.find(Member.class, num));
    }

    @Override
    public List<Member> findAll() {
        return em.createQuery("SELECT m FROM Member m", Member.class).getResultList();
    }

}
