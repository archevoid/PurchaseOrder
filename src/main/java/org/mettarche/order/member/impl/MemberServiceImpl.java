package org.mettarche.order.member.impl;

import lombok.RequiredArgsConstructor;
import org.mettarche.order.member.MemberRepository;
import org.mettarche.order.member.MemberService;
import org.mettarche.order.member.dto.ActivateDto;
import org.mettarche.order.member.dto.MemberDto;
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
    public Member enroll(MemberDto memberDTO) {
        return memberRepository.save(memberDTO.toEntity());
    }

    @Override
    public Member updateUser(MemberDto memberDTO) {
        return null;
    }

    @Override
    public Member inactivateUser(ActivateDto activateDTO) {
        return null;
    }

    @Override
    public Member activateUser(ActivateDto activateDTO) {
        return null;
    }

    @Override
    public List<MemberDto> getMembers() {
        return null;
    }

    @Override
    public MemberDto getMember(MemberDto memberDTO) {
        return null;
    }
}
