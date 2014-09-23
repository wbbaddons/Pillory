{include file='documentHeader'}

<head>
	<title>{lang}wcf.pillory.type.userDeletions{/lang} {if $pageNo > 1}- {lang}wcf.page.pageNo{/lang} {/if}- {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
</head>

<body id="tpl{$templateName|ucfirst}" data-template="{$templateName}">

{capture assign='sidebar'}
	{include file="pillorySidebar"}
{/capture}

{include file='header' sidebarOrientation='left'}

<header class="boxHeadline">
	<h1>{lang}wcf.pillory.userDeletions{/lang}</h1>
</header>

{include file='userNotice'}

<div class="contentNavigation">
	{pages print=true assign=pagesLinks controller='PilloryUserDeletions' link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}
</div>

{if !$items}
	<p class="info">{lang}wcf.pillory.userDeletion.noitems{/lang}</p>
{else}
	<div class="marginTop tabularBox tabularBoxTitle pilloryBanList">
		<header>
			<h2>{lang}wcf.pillory.userDeletions{/lang} <span class="badge badgeInverse">{#$items}</span></h2>
		</header>
		
		<table class="table">
			<thead>
				<tr>
					<th colspan="2" class="columnTitle columnUsername{if $sortField == 'username'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryUserDeletions'}pageNo={@$pageNo}&sortField=username&sortOrder={if $sortField == 'username' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.user.username{/lang}</a></th>
					<th class="columnText columnDeletion{if $sortField == 'quitStarted'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryUserDeletions'}pageNo={@$pageNo}&sortField=quitStarted&sortOrder={if $sortField == 'quitStarted' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.pillory.userDeletions.deletion{/lang}</a></th>
					<th class="columnText columnActivity{if $sortField == 'lastActivity'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryUserDeletions'}pageNo={@$pageNo}&sortField=lastActivity&sortOrder={if $sortField == 'lastActivity' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.user.lastActivityTime{/lang}</a></th>
					
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
						<td class="columnText columnReason">{$user->quitStarted+7*86400|plainTime}</td>
						<td class="columnText columnActivity">{if $user->canViewOnlineStatus()}{@$user->getLastActivityTime()|time}{else}{lang}wcf.pillory.activityUnknown{/lang}{/if}</td>
						
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