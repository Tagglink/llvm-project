; RUN: llc -mtriple=riscv32 -mattr=+experimental-v,+f,+experimental-zfh -verify-machineinstrs \
; RUN:   --riscv-no-aliases < %s | FileCheck %s
declare <vscale x 1 x float> @llvm.riscv.vfwadd.w.nxv1f16(
  <vscale x 1 x float>,
  <vscale x 1 x half>,
  i32);

define <vscale x 1 x float> @intrinsic_vfwadd.w_wv_nxv1f32_nxv1f16(<vscale x 1 x float> %0, <vscale x 1 x half> %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wv_nxv1f32_nxv1f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,ta,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 1 x float> @llvm.riscv.vfwadd.w.nxv1f16(
    <vscale x 1 x float> %0,
    <vscale x 1 x half> %1,
    i32 %2)

  ret <vscale x 1 x float> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwadd.w.mask.nxv1f16(
  <vscale x 1 x float>,
  <vscale x 1 x float>,
  <vscale x 1 x half>,
  <vscale x 1 x i1>,
  i32);

define <vscale x 1 x float> @intrinsic_vfwadd.w_mask_wv_nxv1f32_nxv1f16(<vscale x 1 x float> %0, <vscale x 1 x float> %1, <vscale x 1 x half> %2, <vscale x 1 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wv_nxv1f32_nxv1f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,tu,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 1 x float> @llvm.riscv.vfwadd.w.mask.nxv1f16(
    <vscale x 1 x float> %0,
    <vscale x 1 x float> %1,
    <vscale x 1 x half> %2,
    <vscale x 1 x i1> %3,
    i32 %4)

  ret <vscale x 1 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwadd.w.nxv2f16(
  <vscale x 2 x float>,
  <vscale x 2 x half>,
  i32);

define <vscale x 2 x float> @intrinsic_vfwadd.w_wv_nxv2f32_nxv2f16(<vscale x 2 x float> %0, <vscale x 2 x half> %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wv_nxv2f32_nxv2f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,ta,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 2 x float> @llvm.riscv.vfwadd.w.nxv2f16(
    <vscale x 2 x float> %0,
    <vscale x 2 x half> %1,
    i32 %2)

  ret <vscale x 2 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwadd.w.mask.nxv2f16(
  <vscale x 2 x float>,
  <vscale x 2 x float>,
  <vscale x 2 x half>,
  <vscale x 2 x i1>,
  i32);

define <vscale x 2 x float> @intrinsic_vfwadd.w_mask_wv_nxv2f32_nxv2f16(<vscale x 2 x float> %0, <vscale x 2 x float> %1, <vscale x 2 x half> %2, <vscale x 2 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wv_nxv2f32_nxv2f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,tu,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 2 x float> @llvm.riscv.vfwadd.w.mask.nxv2f16(
    <vscale x 2 x float> %0,
    <vscale x 2 x float> %1,
    <vscale x 2 x half> %2,
    <vscale x 2 x i1> %3,
    i32 %4)

  ret <vscale x 2 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwadd.w.nxv4f16(
  <vscale x 4 x float>,
  <vscale x 4 x half>,
  i32);

define <vscale x 4 x float> @intrinsic_vfwadd.w_wv_nxv4f32_nxv4f16(<vscale x 4 x float> %0, <vscale x 4 x half> %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wv_nxv4f32_nxv4f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,ta,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 4 x float> @llvm.riscv.vfwadd.w.nxv4f16(
    <vscale x 4 x float> %0,
    <vscale x 4 x half> %1,
    i32 %2)

  ret <vscale x 4 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwadd.w.mask.nxv4f16(
  <vscale x 4 x float>,
  <vscale x 4 x float>,
  <vscale x 4 x half>,
  <vscale x 4 x i1>,
  i32);

define <vscale x 4 x float> @intrinsic_vfwadd.w_mask_wv_nxv4f32_nxv4f16(<vscale x 4 x float> %0, <vscale x 4 x float> %1, <vscale x 4 x half> %2, <vscale x 4 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wv_nxv4f32_nxv4f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,tu,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 4 x float> @llvm.riscv.vfwadd.w.mask.nxv4f16(
    <vscale x 4 x float> %0,
    <vscale x 4 x float> %1,
    <vscale x 4 x half> %2,
    <vscale x 4 x i1> %3,
    i32 %4)

  ret <vscale x 4 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwadd.w.nxv8f16(
  <vscale x 8 x float>,
  <vscale x 8 x half>,
  i32);

define <vscale x 8 x float> @intrinsic_vfwadd.w_wv_nxv8f32_nxv8f16(<vscale x 8 x float> %0, <vscale x 8 x half> %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wv_nxv8f32_nxv8f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,ta,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 8 x float> @llvm.riscv.vfwadd.w.nxv8f16(
    <vscale x 8 x float> %0,
    <vscale x 8 x half> %1,
    i32 %2)

  ret <vscale x 8 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwadd.w.mask.nxv8f16(
  <vscale x 8 x float>,
  <vscale x 8 x float>,
  <vscale x 8 x half>,
  <vscale x 8 x i1>,
  i32);

define <vscale x 8 x float> @intrinsic_vfwadd.w_mask_wv_nxv8f32_nxv8f16(<vscale x 8 x float> %0, <vscale x 8 x float> %1, <vscale x 8 x half> %2, <vscale x 8 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wv_nxv8f32_nxv8f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,tu,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 8 x float> @llvm.riscv.vfwadd.w.mask.nxv8f16(
    <vscale x 8 x float> %0,
    <vscale x 8 x float> %1,
    <vscale x 8 x half> %2,
    <vscale x 8 x i1> %3,
    i32 %4)

  ret <vscale x 8 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwadd.w.nxv16f16(
  <vscale x 16 x float>,
  <vscale x 16 x half>,
  i32);

define <vscale x 16 x float> @intrinsic_vfwadd.w_wv_nxv16f32_nxv16f16(<vscale x 16 x float> %0, <vscale x 16 x half> %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wv_nxv16f32_nxv16f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,ta,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
  %a = call <vscale x 16 x float> @llvm.riscv.vfwadd.w.nxv16f16(
    <vscale x 16 x float> %0,
    <vscale x 16 x half> %1,
    i32 %2)

  ret <vscale x 16 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwadd.w.mask.nxv16f16(
  <vscale x 16 x float>,
  <vscale x 16 x float>,
  <vscale x 16 x half>,
  <vscale x 16 x i1>,
  i32);

define <vscale x 16 x float> @intrinsic_vfwadd.w_mask_wv_nxv16f32_nxv16f16(<vscale x 16 x float> %0, <vscale x 16 x float> %1, <vscale x 16 x half> %2, <vscale x 16 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wv_nxv16f32_nxv16f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,tu,mu
; CHECK:       vfwadd.wv {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}, v0.t
  %a = call <vscale x 16 x float> @llvm.riscv.vfwadd.w.mask.nxv16f16(
    <vscale x 16 x float> %0,
    <vscale x 16 x float> %1,
    <vscale x 16 x half> %2,
    <vscale x 16 x i1> %3,
    i32 %4)

  ret <vscale x 16 x float> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwadd.w.nxv1f32.f16(
  <vscale x 1 x float>,
  half,
  i32);

define <vscale x 1 x float> @intrinsic_vfwadd.w_wf_nxv1f32_f16(<vscale x 1 x float> %0, half %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wf_nxv1f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,ta,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 1 x float> @llvm.riscv.vfwadd.w.nxv1f32.f16(
    <vscale x 1 x float> %0,
    half %1,
    i32 %2)

  ret <vscale x 1 x float> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwadd.w.mask.nxv1f32.f16(
  <vscale x 1 x float>,
  <vscale x 1 x float>,
  half,
  <vscale x 1 x i1>,
  i32);

define <vscale x 1 x float> @intrinsic_vfwadd.w_mask_wf_nxv1f32_f16(<vscale x 1 x float> %0, <vscale x 1 x float> %1, half %2, <vscale x 1 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wf_nxv1f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf4,tu,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 1 x float> @llvm.riscv.vfwadd.w.mask.nxv1f32.f16(
    <vscale x 1 x float> %0,
    <vscale x 1 x float> %1,
    half %2,
    <vscale x 1 x i1> %3,
    i32 %4)

  ret <vscale x 1 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwadd.w.nxv2f32.f16(
  <vscale x 2 x float>,
  half,
  i32);

define <vscale x 2 x float> @intrinsic_vfwadd.w_wf_nxv2f32_f16(<vscale x 2 x float> %0, half %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wf_nxv2f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,ta,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 2 x float> @llvm.riscv.vfwadd.w.nxv2f32.f16(
    <vscale x 2 x float> %0,
    half %1,
    i32 %2)

  ret <vscale x 2 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwadd.w.mask.nxv2f32.f16(
  <vscale x 2 x float>,
  <vscale x 2 x float>,
  half,
  <vscale x 2 x i1>,
  i32);

define <vscale x 2 x float> @intrinsic_vfwadd.w_mask_wf_nxv2f32_f16(<vscale x 2 x float> %0, <vscale x 2 x float> %1, half %2, <vscale x 2 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wf_nxv2f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,mf2,tu,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 2 x float> @llvm.riscv.vfwadd.w.mask.nxv2f32.f16(
    <vscale x 2 x float> %0,
    <vscale x 2 x float> %1,
    half %2,
    <vscale x 2 x i1> %3,
    i32 %4)

  ret <vscale x 2 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwadd.w.nxv4f32.f16(
  <vscale x 4 x float>,
  half,
  i32);

define <vscale x 4 x float> @intrinsic_vfwadd.w_wf_nxv4f32_f16(<vscale x 4 x float> %0, half %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wf_nxv4f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,ta,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 4 x float> @llvm.riscv.vfwadd.w.nxv4f32.f16(
    <vscale x 4 x float> %0,
    half %1,
    i32 %2)

  ret <vscale x 4 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwadd.w.mask.nxv4f32.f16(
  <vscale x 4 x float>,
  <vscale x 4 x float>,
  half,
  <vscale x 4 x i1>,
  i32);

define <vscale x 4 x float> @intrinsic_vfwadd.w_mask_wf_nxv4f32_f16(<vscale x 4 x float> %0, <vscale x 4 x float> %1, half %2, <vscale x 4 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wf_nxv4f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m1,tu,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 4 x float> @llvm.riscv.vfwadd.w.mask.nxv4f32.f16(
    <vscale x 4 x float> %0,
    <vscale x 4 x float> %1,
    half %2,
    <vscale x 4 x i1> %3,
    i32 %4)

  ret <vscale x 4 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwadd.w.nxv8f32.f16(
  <vscale x 8 x float>,
  half,
  i32);

define <vscale x 8 x float> @intrinsic_vfwadd.w_wf_nxv8f32_f16(<vscale x 8 x float> %0, half %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wf_nxv8f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,ta,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 8 x float> @llvm.riscv.vfwadd.w.nxv8f32.f16(
    <vscale x 8 x float> %0,
    half %1,
    i32 %2)

  ret <vscale x 8 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwadd.w.mask.nxv8f32.f16(
  <vscale x 8 x float>,
  <vscale x 8 x float>,
  half,
  <vscale x 8 x i1>,
  i32);

define <vscale x 8 x float> @intrinsic_vfwadd.w_mask_wf_nxv8f32_f16(<vscale x 8 x float> %0, <vscale x 8 x float> %1, half %2, <vscale x 8 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wf_nxv8f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m2,tu,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 8 x float> @llvm.riscv.vfwadd.w.mask.nxv8f32.f16(
    <vscale x 8 x float> %0,
    <vscale x 8 x float> %1,
    half %2,
    <vscale x 8 x i1> %3,
    i32 %4)

  ret <vscale x 8 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwadd.w.nxv16f32.f16(
  <vscale x 16 x float>,
  half,
  i32);

define <vscale x 16 x float> @intrinsic_vfwadd.w_wf_nxv16f32_f16(<vscale x 16 x float> %0, half %1, i32 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_wf_nxv16f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,ta,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}
  %a = call <vscale x 16 x float> @llvm.riscv.vfwadd.w.nxv16f32.f16(
    <vscale x 16 x float> %0,
    half %1,
    i32 %2)

  ret <vscale x 16 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwadd.w.mask.nxv16f32.f16(
  <vscale x 16 x float>,
  <vscale x 16 x float>,
  half,
  <vscale x 16 x i1>,
  i32);

define <vscale x 16 x float> @intrinsic_vfwadd.w_mask_wf_nxv16f32_f16(<vscale x 16 x float> %0, <vscale x 16 x float> %1, half %2, <vscale x 16 x i1> %3, i32 %4) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfwadd.w_mask_wf_nxv16f32_f16
; CHECK:       vsetvli {{.*}}, {{a[0-9]+}}, e16,m4,tu,mu
; CHECK:       vfwadd.wf {{v[0-9]+}}, {{v[0-9]+}}, {{ft[0-9]+}}, v0.t
  %a = call <vscale x 16 x float> @llvm.riscv.vfwadd.w.mask.nxv16f32.f16(
    <vscale x 16 x float> %0,
    <vscale x 16 x float> %1,
    half %2,
    <vscale x 16 x i1> %3,
    i32 %4)

  ret <vscale x 16 x float> %a
}
