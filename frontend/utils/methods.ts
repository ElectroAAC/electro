import { vocations as VocationList } from '@/utils/enum';

export const getVocationName = (vocation_id: Number | number): String => {
  const vocation = VocationList.find((vocation) => vocation_id >= vocation.initial_id && vocation_id <= vocation.last_id);

  if (vocation && vocation.text)
    return vocation.text;
  return "Default";
}