#!/usr/bin/env bash

if [[ "${#}" -ne 1 ]]; then
	echo "Usage: ${0} BASE_PATH"
	exit 1
fi

if [[ -z "${LOCAL}" || ! -d "${LOCAL}" ]]; then
	echo "Error: LOCAL='${LOCAL}'"
	exit 1
fi

if [[ -z "${OPT}" || ! -d "${OPT}" ]]; then
	echo "Error: OPT='${OPT}'"
	exit 1
fi

BASE_PATH="$(realpath "${1}")"

# Determine where the software should be local installed
use_opt=0
if [[ ! -d "${BASE_PATH}" ]]; then
	echo "${BASE_PATH} will not fit in the ${LOCAL} structure"
	use_opt=1
else
	for path in "${BASE_PATH}"/*; do
		name="$(basename "${path}")"
		if [[ ! -d "${path}" ]] || [[ ! "${name}" =~ ^(bin|doc|etc|games|include|lib|lib64|libexec|man|sbin|share|src)$ ]]; then
			echo "${path} will not fit in the ${LOCAL} structure"
			use_opt=1
		fi
	done
fi

if [[ "${use_opt}" -ne 1 ]]; then
	echo "Symlinking ${BASE_PATH} into the ${LOCAL} structure"
	while read -r target_path; do
		relative_path="$(realpath "${target_path}" -s --relative-to="${BASE_PATH}")" # '-s' to avoid overwriting install symlinks like clang in local
		symlink_path="${LOCAL}/${relative_path}"
		symlink_dir="$(dirname "${symlink_path}")"
		if [[ ! -d "${symlink_dir}" ]]; then
			mkdir -p "${symlink_dir}"
		fi
		ln -snf "${target_path}" "${symlink_path}"
	done < <(find "${BASE_PATH}" -type f -o -type l -xtype f) # '-type l' to include install symlinks like clang
else
	echo "Symlinking ${BASE_PATH} into the ${OPT} structure"
	base_name="$(basename "${BASE_PATH}")"
	symlink_path="${OPT}/${base_name}"
	ln -sf "${BASE_PATH}" "${symlink_path}"
fi
