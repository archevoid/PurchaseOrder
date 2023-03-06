package org.mettarche.order.member.impl;

import lombok.RequiredArgsConstructor;
import org.mettarche.order.member.MemberRepository;
import org.mettarche.order.member.entity.Member;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;


@Repository
@RequiredArgsConstructor
public class JpaMemberRepository implements MemberRepository {

    private final EntityManager em;


    @Override
    public Member save(Member member) {
        em.persist(member);

        return em.find(Member.class, member.getNum());
    }

    @Override
    public Optional<Member> findByNum(Long num) {
        return Optional.ofNullable(em.find(Member.class, num));
    }

    @Override
    public List<Member> findAll() {
        return em.createQuery("SELECT m FROM Member m", Member.class).getResultList();
    }

    @Override
    public Member update(Member member) {
        Query query = em.createQuery(
                "UPDATE Member m SET m.id = :id, m.password = :pw, m.activation = :act, m.privileged = :pri WHERE m.num = :num")
                .setParameter("num", member.getNum());

        if (query.executeUpdate() != 0) {
            return null;
        }

        return em.find(Member.class, member.getNum());
    }

}
