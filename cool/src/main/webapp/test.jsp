<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<HTML>
	<HEAD>

<!--
	This Family Echo file is Copyright (c) Familiality Ltd.

	This file may be distributed only in whole and unmodified, as part of a
	family downloaded from Family Echo. You may make this file available on the
	World Wide Web without modification, only if used to display a family
	downloaded from Family Echo. You may make copies of this file for personal
	archiving purposes, only as part of a family downloaded from Family Echo.

	This file may not be distributed or copied for any other purpose. You are
	not permitted to modify, merge, publish, sublicense, rent, sell, lease,
	loan, decompile, reverse engineer or create derivative works from this file.

	This copyright and license notice must be kept in all copies of this file.
-->

		<LINK REL="stylesheet" TYPE="text/css" HREF="js/styles.css?171223">
		
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
		
		<script src="js/common.js?171223" type="text/javascript"></script>
		<script src="js/family.js?171223" type="text/javascript"></script>	
		
	</HEAD>
	
	<BODY CLASS="lbody" onLoad="PL();">
	
		<TABLE WIDTH="100%" HEIGHT="100%" CELLSPACING=0 CELLPADDING=6><FORM onSubmit="return false;">

		<TR VALIGN="top"><TD ALIGN="center">
			
			
			<DIV ID="nonediting">
				
				<INPUT ID="hideurl" TYPE="submit" VALUE="Back to family tree" CLASS="sbutton" STYLE="display:none; margin-top:6px;" onClick="parent.ESM('view'); return false;">
				<INPUT ID="showurl" TYPE="submit" CLASS="sbutton" STYLE="display:none; margin-top:6px;" onClick="return UL(GE('urllink'));"><INPUT ID="urlmode" TYPE="hidden" VALUE=""><A HREF="#" ID="urllink" STYLE="display:none;"></A>
				<INPUT ID="shareperson" TYPE="submit" VALUE="Share family" CLASS="sbutton" STYLE="display:none; margin-top:6px;" onClick="parent.ESM('share'); return false;">
			</DIV>
		
			<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 STYLE="margin-top:12px;">
				<TR>
					<TD ALIGN="center" ID="switchpanel0" CLASS="sswitched">
						<A HREF="#" onMouseDown="SWA(0); return false;" ID="switchlink0" CLASS="sswitchedlink">Personal</A>
					</TD>
					<TD ALIGN="center" ID="switchpanel3" CLASS="sswitch">
						<A HREF="#" onMouseDown="SWA(3); return false;" ID="switchlink3">Partners</A>
					</TD>
					<TD ALIGN="center" ID="switchpanel1" CLASS="sswitch">
						<A HREF="#" onMouseDown="SWA(1); return false;" ID="switchlink1">Contact</A>
					</TD>
					<TD ALIGN="center" ID="switchpanel2" CLASS="sswitch">
						<A HREF="#" onMouseDown="SWA(2); return false;" ID="switchlink2">Biographical</A>
					</TD>
				</TR>
			</TABLE>
			
			<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 CLASS="spanel">
				<TR><TD><IMG SRC="blankpixel.gif" WIDTH="1" HEIGHT="6"></TD></TR>
				
				<TBODY ID="personalview" CLASS="hiderows">
				</TBODY>
				
				<TBODY ID="personaledit" CLASS="hiderows">
					<TR>
						<TD CLASS="sleft">
							First names:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="personalname" CLASS="sfield" onChange="SCV('personalname');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Surname now:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="familyname" CLASS="sfield" onChange="SCV('familyname');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Surname at birth:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="familybirth" CLASS="sfield" onChange="SCV('familybirth');" onFocus="SFV('familybirth');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Gender:
						</TD>
						<TD CLASS="sright">
							<DIV STYLE="margin:2px 0px;">
								<INPUT TYPE="radio" NAME="gender" ID="gender_f" onClick="SSG('f');" STYLE="margin-right:4px;">Female&nbsp;
								<INPUT TYPE="radio" NAME="gender" ID="gender_m" onClick="SSG('m');" STYLE="margin-right:4px;">Male&nbsp;
								<INPUT TYPE="radio" NAME="gender" ID="gender_o" onClick="SSG('o');" STYLE="margin-right:4px;">Other
							</DIV>
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Birth date:
						</TD>
						<TD CLASS="sright">
							<SELECT ID="birthmonth" CLASS="sselect" TITLE="Month" onChange="SCV('birth');"></SELECT>&nbsp;
							<SELECT ID="birthdom" CLASS="sselect" TITLE="Day" onChange="SCV('birth');"></SELECT>&nbsp;
							<INPUT ID="birthyear" CLASS="syear" TITLE="Year" onChange="SCV('birth');" MAXLENGTH=4>
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
						</TD>
						<TD CLASS="sright">
							<DIV STYLE="margin:2px 0px;">
								<INPUT TYPE="checkbox" ID="alive" onClick="SCV('alive');">
								This person is living
							</DIV>
						</TD>
					</TR>
				</TBODY>
				<TBODY ID="personaleditdeath" CLASS="hiderows">
					<TR>
						<TD CLASS="sleft">
							Death date:
						</TD>
						<TD CLASS="sright">
							<SELECT ID="deathmonth" CLASS="sselect" TITLE="Month" onChange="SCV('death');"></SELECT>&nbsp;
							<SELECT ID="deathdom" CLASS="sselect" TITLE="Day" onChange="SCV('death');"></SELECT>&nbsp;
							<INPUT ID="deathyear" CLASS="syear" TITLE="Year" onChange="SCV('death');" MAXLENGTH=4>
						</TD>
					</TR>
				</TBODY>
				
				<TBODY ID="partnersviewedit" CLASS="hiderows">
				</TBODY>
				
				<TBODY ID="contactview" CLASS="hiderows">
				</TBODY>

				<TBODY ID="contactedit" CLASS="hiderows">
					<TR>
						<TD CLASS="sleft">
							Email:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="email" CLASS="sfield" onChange="SCV('email');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Website:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="website" CLASS="sfield" onChange="SCV('website');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Blog:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="blog" CLASS="sfield" onChange="SCV('blog');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Photo site:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="photosite" CLASS="sfield" onChange="SCV('photosite');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Home tel:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="hometel" CLASS="sfield" onChange="SCV('hometel');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Work tel:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="worktel" CLASS="sfield" onChange="SCV('worktel');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Mobile:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="mobile" CLASS="sfield" onChange="SCV('mobile');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Skype:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="skype" CLASS="sfield" onChange="SCV('skype');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft" STYLE="vertical-align:top;">
							Address:
						</TD>
						<TD CLASS="sright">
							<TEXTAREA ID="address" CLASS="sfield" ROWS=3 onChange="SCV('address');"></TEXTAREA>
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Other:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="othercontact" CLASS="sfield" onChange="SCV('othercontact');">
						</TD>
					</TR>
				</TBODY>

				<TBODY ID="bioview" CLASS="hiderows">
				</TBODY>

				<TBODY ID="bioedit1" CLASS="hiderows">
					<TR>
						<TD CLASS="sleft">
							Birth place:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="birthplace" CLASS="sfield" onChange="SCV('birthplace');">
						</TD>
					</TR>
				</TBODY>

				<TBODY ID="bioeditdeath" CLASS="hiderows">
					<TR>
						<TD CLASS="sleft">
							Death place:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="deathplace" CLASS="sfield" onChange="SCV('deathplace');">
						</TD>
					</TR>

					<TR>
						<TD CLASS="sleft">
							Burial place:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="burialplace" CLASS="sfield" onChange="SCV('burialplace');">
						</TD>
					</TR>

					<TR>
						<TD CLASS="sleft">
							Burial date:
						</TD>
						<TD CLASS="sright">
							<SELECT ID="burialmonth" CLASS="sselect" TITLE="Month" onChange="SCV('burial');"></SELECT>&nbsp;
							<SELECT ID="burialdom" CLASS="sselect" TITLE="Day" onChange="SCV('burial');"></SELECT>&nbsp;
							<INPUT ID="burialyear" CLASS="syear" TITLE="Year" onChange="SCV('burial');" MAXLENGTH=4>
						</TD>
					</TR>
				</TBODY>

				<TBODY ID="bioedit2" CLASS="hiderows">
					<TR>
						<TD CLASS="sleft">
							Profession:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="profession" CLASS="sfield" onChange="SCV('profession');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Company:
						</TD>
						<TD CLASS="sright">
							<INPUT ID="employer" CLASS="sfield" onChange="SCV('employer');">
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Interests:
						</TD>
						<TD CLASS="sright">
							<TEXTAREA ID="interests" CLASS="sfield" ROWS=3 onChange="SCV('interests');"></TEXTAREA>
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Activities:
						</TD>
						<TD CLASS="sright">
							<TEXTAREA ID="activities" CLASS="sfield" ROWS=3 onChange="SCV('activities');"></TEXTAREA>
						</TD>
					</TR>
					<TR>
						<TD CLASS="sleft">
							Bio notes:
						</TD>
						<TD CLASS="sright">
							<TEXTAREA ID="bionotes" CLASS="sfield" ROWS=4 onChange="SCV('bionotes');"></TEXTAREA>
						</TD>
					</TR>
				</TBODY>

				<TBODY ID="viewfooter" CLASS="hiderows">
					<TR><TD><IMG SRC="blankpixel.gif" WIDTH="1" HEIGHT="6"></TD></TR>
					<TR>
						<TD CLASS="sboth" COLSPAN="2">
							<INPUT TYPE="submit" ID="editbutton" VALUE="Edit details" CLASS="sbutton" onClick="SED(); return false;">
						</TD>
					</TR>
				</TBODY>
				
				<TBODY ID="editfooter" CLASS="hiderows">
					<TR><TD><IMG SRC="blankpixel.gif" WIDTH="1" HEIGHT="12"></TD></TR>
					<TR>
						<TD CLASS="sboth" COLSPAN="2">
							You can also add or change details later.
						</TD>
					</TR>
					<TR><TD><IMG SRC="blankpixel.gif" WIDTH="1" HEIGHT="6"></TD></TR>
					<TR>
						<TD CLASS="sboth" COLSPAN="2">
							<INPUT TYPE="submit" VALUE="OK" CLASS="sbutton2" onClick="SAS(); return false;">
							&nbsp;
							<INPUT TYPE="submit" VALUE="Cancel" CLASS="sbutton2" onClick="SCS(); return false;">
						</TD>
					</TR>
				</TBODY>
				
				<TR><TD><IMG SRC="blankpixel.gif" WIDTH="1" HEIGHT="6"></TD></TR>
			</TABLE>
			
			</DIV>

			<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0>
				<TR><TD><IMG SRC="blankpixel.gif" WIDTH="1" HEIGHT="12"></TD></TR>
			
				<TBODY ID="readonlyfooter" CLASS="hiderows">
					<TR>
						<TD CLASS="sboth" COLSPAN="2">
							You are not currently permitted to edit this family.
						</TD>
					</TR>
					<TR><TD><IMG SRC="blankpixel.gif" WIDTH="1" HEIGHT="12"></TD></TR>
				</TBODY>

				<TBODY ID="writemefooter" CLASS="hiderows">
					<TR>
						<TD CLASS="sboth" COLSPAN="2">
							<A HREF="#" onClick="parent.GE('do_signin').click(); return false;">Sign in</A>
							to add more people to this family.
						</TD>
					</TR>
					<TR><TD><IMG SRC="blankpixel.gif" WIDTH="1" HEIGHT="12"></TD></TR>
				</TBODY>

				<TBODY ID="writenotfooter" CLASS="hiderows">
					<TR>
						<TD CLASS="sboth" COLSPAN="2">
							<A HREF="#" onClick="parent.GE('do_signin').click(); return false;">Sign in</A>
							to edit these details or add new people.
						</TD>
					</TR>
					<TR><TD><IMG SRC="blankpixel.gif" WIDTH="1" HEIGHT="12"></TD></TR>
				</TBODY>
				
				<TBODY ID="relactions" CLASS="hiderows">
				</TBODY>
			</TABLE>
			
		</TD></TR>
			
		<TR VALIGN="bottom"><TD ALIGN="center">
			<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0>
				<TBODY ID="importfooter" CLASS="hiderows">
					<TR>
						<TD CLASS="sboth" COLSPAN="2">
							<INPUT TYPE="submit" VALUE="Import GEDCOM or FamilyScript..." CLASS="sbutton" onClick="parent.ESM('import'); return false;">
						</TD>
					</TR>
				</TBODY>
				<TBODY ID="clearfooter" CLASS="hiderows">
					<TR>
						<TD CLASS="sboth" COLSPAN="2">
							<INPUT TYPE="submit" VALUE="Clear family and start over..." CLASS="sbutton" onClick="SCC(); return false;">
						</TD>
					</TR>
				</TBODY>
				<TBODY ID="downloadfooter" CLASS="hiderows">
					<TR>
						<TD CLASS="sboth" COLSPAN="2">
							<INPUT TYPE="submit" VALUE="Download / export this family..." CLASS="sbutton" onClick="parent.ESM('download'); return false;">
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</TD></TR>
		
		</FORM></TABLE>

	</BODY>
</HTML>