{include file='documentHeader'}

<head>
	<title>{lang}wcf.pillory.bans{/lang} {if $pageNo > 1}- {lang}wcf.page.pageNo{/lang} {/if}- {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}">

{capture assign='sidebar'}
	{include file="pillorySidebar"}
{/capture}

{include file='header' sidebarOrientation='left'}

<header class="boxHeadline">
	<h1>{lang}wcf.pillory.bans{/lang}</h1>
</header>

{include file='userNotice'}

<div class="contentNavigation">
	{pages print=true assign=pagesLinks controller='PilloryBans' link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}
</div>

{if !$items}
	<p class="info">{lang}wcf.pillory.bans.noitems{/lang}</p>
{else}
	<div class="marginTop tabularBox tabularBoxTitle pilloryBanList">
		<header>
			<h2>{lang}wcf.pillory.bans{/lang} <span class="badge badgeInverse">{#$items}</span></h2>
		</header>
		
		<table class="table">
			<thead>
				<tr>
					<th colspan="2" class="columnTitle columnUsername{if $sortField == 'username'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryBans'}pageNo={@$pageNo}&sortField=username&sortOrder={if $sortField == 'username' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.user.username{/lang}</a></th>
					<th class="columnText columnReason{if $sortField == 'banReason'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryBans'}pageNo={@$pageNo}&sortField=banReason&sortOrder={if $sortField == 'banReason' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.user.banReason{/lang}</a></th>
					<th class="columnText columnActivity{if $sortField == 'lastActivityTime'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryBans'}pageNo={@$pageNo}&sortField=lastActivityTime&sortOrder={if $sortField == 'lastActivityTime' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.user.lastActivityTime{/lang}</a></th>
					
					{event name='columnHeads'}
				</tr>
			</thead>
			
			<tbody>
				{foreach from=$objects item=user}
					<tr class="user">
						<td class="columnIcon columnAvatar">
							{if $user->getAvatar()}
								<div>
									<p class="framed">{@$user->getAvatar()->getImageTag(32)}</p>
								</div>
							{/if}
						</td>
						<td class="columnText columnUsername">
							<h3>
								<a href="{link controller='User' object=$user->getDecoratedObject()}{/link}">{$user->username}</a>
							</h3>
						</td>
						<td class="columnText columnReason">{if $user->banReason}{$user->banReason|htmlspecialchars|nl2br}{else}<em>{lang}wcf.pillory.bans.noReason{/lang}</em>{/if}</td>
						<td class="columnText columnActivity">{if $user->canViewOnlineStatus()}{@$user->getLastActivityTime()|time}{else}<em>{lang}wcf.pillory.warnings.judge.unknown{/lang}</em>{/if}</td>
						
						{event name='columns'}
					</tr>
				{/foreach}
			</tbody>
		</table>
	</div>
{/if}

<div class="contentNavigation">
	{@$pagesLinks}
</div>

{include file='footer'}

</body>
</html>