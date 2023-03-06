package org.mettarche.order.member;

import org.mettarche.order.member.dto.MemberDto;
import org.mettarche.order.member.entity.Member;
import java.util.List;

public interface MemberService {

    Member enroll(MemberDto memberDTO);

    Member updateUser(MemberDto memberDTO);

    Member inactivateUser(MemberDto memberDTO);

    Member activateUser(MemberDto memberDTO);

    List<MemberDto> getMembers();

    MemberDto getMember(MemberDto memberDTO);
}
