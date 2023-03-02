package org.mettarche.order.member.impl;

import lombok.RequiredArgsConstructor;
import org.mettarche.order.member.MemberRepository;
import org.mettarche.order.member.MemberService;
import org.mettarche.order.member.dto.ActivateDTO;
import org.mettarche.order.member.dto.MemberDTO;
import org.mettarche.order.member.entity.Member;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;


    @Override
    public Member enroll(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO.toEntity());
    }

    @Override
    public Member updateUser(MemberDTO memberDTO) {
        return null;
    }

    @Override
    public Member inactivateUser(ActivateDTO activateDTO) {
        return null;
    }

    @Override
    public Member activateUser(ActivateDTO activateDTO) {
        return null;
    }

    @Override
    public List<MemberDTO> getMembers() {
        return null;
    }

    @Override
    public MemberDTO getMember(MemberDTO memberDTO) {
        return null;
    }
}
