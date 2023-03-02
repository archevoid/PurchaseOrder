package org.mettarche.order.member;

import org.mettarche.order.member.dto.ActivateDTO;
import org.mettarche.order.member.dto.MemberDTO;
import org.mettarche.order.member.entity.Member;
import java.util.List;

public interface MemberService {

    Member enroll(MemberDTO memberDTO);

    Member updateUser(MemberDTO memberDTO);

    Member inactivateUser(ActivateDTO activateDTO);

    Member activateUser(ActivateDTO activateDTO);

    List<MemberDTO> getMembers();

    MemberDTO getMember(MemberDTO memberDTO);
}
