# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/PrefabLightmapData.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name PrefabLightmapData
extends Node  # TODO: was MonoBehaviour
  func _init():
    if m_RendererInfo == null  or  m_RendererInfo.Length == 0:
      return
    LightmapData[] lightmaps = LightmapSettings.lightmaps
    LightmapData[] array = new LightmapData[lightmaps.Length + m_Lightmaps.Length]
    lightmaps.CopyTo(array, 0)
    for i in range(int(this.m_Lightmaps.Length)):
      array[i + lightmaps.Length] = new LightmapData()
      array[i + lightmaps.Length].lightmapColor = m_Lightmaps[i]
    PrefabLightmapData.ApplyRendererInfo(m_RendererInfo, lightmaps.Length)
    LightmapSettings.lightmaps = array

  func ApplyRendererInfo(infos: Variant, lightmapOffsetIndex: int):
    foreach (PrefabLightmapData.RendererInfo rendererInfo in infos) {
    rendererInfo.renderer.lightmapIndex = rendererInfo.lightmapIndex + lightmapOffsetIndex
    rendererInfo.renderer.lightmapScaleOffset = rendererInfo.lightmapOffsetScale

private PrefabLightmapData.RendererInfo[] m_RendererInfo

private Texture2D[] m_Lightmaps

private struct RendererInfo {
var renderer: Variant

var lightmapIndex: int

var lightmapOffsetScale: Variant
