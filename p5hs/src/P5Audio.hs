module P5Audio where

import P5Render
import P5Expressions

data AudioAttributes a
  = Gain
  | InitFFT
  | FreqBin (ArgEx a)
  deriving(Show,Eq)

instance (Show a, Renderer a) => Renderer (AudioAttributes a) where
  render InitFFT = "let spectrum = fft.analyze();"
  render Gain = "microphone.getLevel()"
  render (FreqBin argex) = "spectrum[" ++ (render argex) ++ "]"
