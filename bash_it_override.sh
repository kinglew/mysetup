# override some bash_it functions for optimization/customization
# original /bash_it/themes/base.theme.bash

function git_prompt_vars {
  #echo 'dodo2'
  #time git_prompt_vars_2
  git_prompt_vars_2
}

function git_prompt_vars_2 {
  if _git-branch &> /dev/null; then
    SCM_GIT_DETACHED="false"
    SCM_BRANCH="${SCM_THEME_BRANCH_PREFIX}\$(_git-friendly-ref)$(_git-remote-info)"
  else
    SCM_GIT_DETACHED="true"

    local detached_prefix
    if _git-tag &> /dev/null; then
      detached_prefix=${SCM_THEME_TAG_PREFIX}
    else
      detached_prefix=${SCM_THEME_DETACHED_PREFIX}
    fi
    SCM_BRANCH="${detached_prefix}\$(_git-friendly-ref)"
  fi

  #IFS=$'\t' read -r commits_behind commits_ahead <<< "$(_git-upstream-behind-ahead)"
  #[[ "${commits_ahead}" -gt 0 ]] && SCM_BRANCH+=" ${SCM_GIT_AHEAD_CHAR}${commits_ahead}"
  #[[ "${commits_behind}" -gt 0 ]] && SCM_BRANCH+=" ${SCM_GIT_BEHIND_CHAR}${commits_behind}"

  #local stash_count
  #stash_count="$(git stash list 2> /dev/null | wc -l | tr -d ' ')"
  #[[ "${stash_count}" -gt 0 ]] && SCM_BRANCH+=" ${SCM_GIT_STASH_CHAR_PREFIX}${stash_count}${SCM_GIT_STASH_CHAR_SUFFIX}"

  SCM_STATE=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  #if ! _git-hide-status; then
  #  IFS=$'\t' read -r untracked_count unstaged_count staged_count <<< "$(_git-status-counts)"
  #  if [[ "${untracked_count}" -gt 0 || "${unstaged_count}" -gt 0 || "${staged_count}" -gt 0 ]]; then
  #    SCM_DIRTY=1
  #    if [[ "${SCM_GIT_SHOW_DETAILS}" = "true" ]]; then
  #      [[ "${staged_count}" -gt 0 ]] && SCM_BRANCH+=" ${SCM_GIT_STAGED_CHAR}${staged_count}" && SCM_DIRTY=3
  #      [[ "${unstaged_count}" -gt 0 ]] && SCM_BRANCH+=" ${SCM_GIT_UNSTAGED_CHAR}${unstaged_count}" && SCM_DIRTY=2
  #      [[ "${untracked_count}" -gt 0 ]] && SCM_BRANCH+=" ${SCM_GIT_UNTRACKED_CHAR}${untracked_count}" && SCM_DIRTY=1
  #    fi
  #    SCM_STATE=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
  #  fi
  #fi

  #[[ "${SCM_GIT_SHOW_CURRENT_USER}" == "true" ]] && SCM_BRANCH+="$(git_user_info)"

  SCM_PREFIX=${GIT_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  SCM_SUFFIX=${GIT_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}

  SCM_CHANGE=$(_git-short-sha 2>/dev/null || echo "")
}


function _my_git_prompt_vars {
  local details=''
  SCM_STATE=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  if [[ "$(git config --get bash-it.hide-status)" != "1" ]]; then
    [[ "${SCM_GIT_IGNORE_UNTRACKED}" = "true" ]] && local git_status_flags='-uno'
    local status_lines=$((git status --porcelain ${git_status_flags} -b 2> /dev/null ||
                          git status --porcelain ${git_status_flags}    2> /dev/null) | git_status_summary)
    local status=$(awk 'NR==1' <<< "$status_lines")
    local counts=$(awk 'NR==2' <<< "$status_lines")
    IFS=$'\t' read untracked_count unstaged_count staged_count <<< "$counts"
    if [[ "${untracked_count}" -gt 0 || "${unstaged_count}" -gt 0 || "${staged_count}" -gt 0 ]]; then
      SCM_DIRTY=1
      if [[ "${SCM_GIT_SHOW_DETAILS}" = "true" ]]; then
        [[ "${staged_count}" -gt 0 ]] && details+=" ${SCM_GIT_STAGED_CHAR}${staged_count}" && SCM_DIRTY=3
        [[ "${unstaged_count}" -gt 0 ]] && details+=" ${SCM_GIT_UNSTAGED_CHAR}${unstaged_count}" && SCM_DIRTY=2
        [[ "${untracked_count}" -gt 0 ]] && details+=" ${SCM_GIT_UNTRACKED_CHAR}${untracked_count}" && SCM_DIRTY=1
      fi
      SCM_STATE=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
    fi
  fi

  [[ "${SCM_GIT_SHOW_CURRENT_USER}" == "true" ]] && details+="$(git_user_info)"

  SCM_CHANGE=$(git rev-parse --short HEAD 2>/dev/null)

  local ref=$(git_clean_branch)

  if [[ -n "$ref" ]]; then
    SCM_BRANCH="${SCM_THEME_BRANCH_PREFIX}${ref}"
    local tracking_info="$(grep -- "${SCM_BRANCH}\.\.\." <<< "${status}")"
    if [[ -n "${tracking_info}" ]]; then
      [[ "${tracking_info}" =~ .+\[gone\]$ ]] && local branch_gone="true"
      tracking_info=${tracking_info#\#\# ${SCM_BRANCH}...}
      tracking_info=${tracking_info% [*}
      local remote_name=${tracking_info%%/*}
      local remote_branch=${tracking_info#${remote_name}/}
      local remote_info=""
      local num_remotes=$(git remote | wc -l 2> /dev/null)
      [[ "${SCM_BRANCH}" = "${remote_branch}" ]] && local same_branch_name=true
      if ([[ "${SCM_GIT_SHOW_REMOTE_INFO}" = "auto" ]] && [[ "${num_remotes}" -ge 2 ]]) ||
          [[ "${SCM_GIT_SHOW_REMOTE_INFO}" = "true" ]]; then
        remote_info="${remote_name}"
        [[ "${same_branch_name}" != "true" ]] && remote_info+="/${remote_branch}"
      elif [[ ${same_branch_name} != "true" ]]; then
        remote_info="${remote_branch}"
      fi
      if [[ -n "${remote_info}" ]];then
        if [[ "${branch_gone}" = "true" ]]; then
          SCM_BRANCH+="${SCM_THEME_BRANCH_GONE_PREFIX}${remote_info}"
        else
          SCM_BRANCH+="${SCM_THEME_BRANCH_TRACK_PREFIX}${remote_info}"
        fi
      fi
    fi
    SCM_GIT_DETACHED="false"
  else
    echo "elsey"
    local detached_prefix=""
    ref=$(git describe --tags --exact-match 2> /dev/null)
    if [[ -n "$ref" ]]; then
      detached_prefix=${SCM_THEME_TAG_PREFIX}
    else
      ref=$(git describe --contains --all HEAD 2> /dev/null)
      ref=${ref#remotes/}
      [[ -z "$ref" ]] && ref=${SCM_CHANGE}
      detached_prefix=${SCM_THEME_DETACHED_PREFIX}
    fi
    SCM_BRANCH=${detached_prefix}${ref}
    SCM_GIT_DETACHED="true"
  fi

  local ahead_re='.+ahead ([0-9]+).+'
  local behind_re='.+behind ([0-9]+).+'
  [[ "${status}" =~ ${ahead_re} ]] && SCM_BRANCH+=" ${SCM_GIT_AHEAD_CHAR}${BASH_REMATCH[1]}"
  [[ "${status}" =~ ${behind_re} ]] && SCM_BRANCH+=" ${SCM_GIT_BEHIND_CHAR}${BASH_REMATCH[1]}"

  SCM_BRANCH+=${details}

  SCM_PREFIX=${GIT_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  SCM_SUFFIX=${GIT_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
}

