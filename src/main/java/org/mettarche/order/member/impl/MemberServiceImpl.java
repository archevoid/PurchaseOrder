package org.mettarche.order.member.impl;

import lombok.RequiredArgsConstructor;
import org.mettarche.order.member.MemberRepository;
import org.mettarche.order.member.MemberService;
import org.mettarche.order.member.dto.MemberDto;
import org.mettarche.order.member.entity.Member;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;


    @Override
    public Member enroll(MemberDto memberDto) {
        return memberRepository.save(memberDto.toEntity());
    }

    @Override
    public Member updateUser(MemberDto memberDto) {
        return memberRepository.update(memberDto.toEntity());
    }

    @Override
    public Member inactivateUser(MemberDto memberDTO) {
        Member member = memberDTO.toEntity();
        member.setActivation(false);

        return memberRepository.update(member);
    }

    @Override
    public Member activateUser(MemberDto memberDTO) {
        Member member = memberDTO.toEntity();
        member.setActivation(true);

        return memberRepository.update(member);
    }

    @Override
    public List<MemberDto> getMembers() {
        List<MemberDto> memberDtoList = new ArrayList<>();

        List<Member> memberList = memberRepository.findAll();

        int i = 0;
        for (Member member : memberList) {
            memberDtoList.set(i++, new MemberDto(member));
        }

        return memberDtoList;
    }

    @Override
    public MemberDto getMember(MemberDto memberDto) {
        Optional<Member> member = memberRepository.findByNum(memberDto.getUserNum());

        if (member.isPresent()) {
            return new MemberDto(member.get());
        } else {
            return null;
        }
    }
}
