<?php

namespace App\Http\Controllers;

use App\Models\ChartOfAccount;
use App\Models\ContractSetting;
use Illuminate\Http\Request;

class ContractSettingController extends Controller
{
    // ─── Index ───────────────────────────────────────────────────────────────────

    public function index()
    {
        $settings = ContractSetting::with(['coaExpenseDr', 'coaPayableCr'])->get();

        return view('contract_settings.index', compact('settings'));
    }

    // ─── Create ──────────────────────────────────────────────────────────────────

    public function create()
    {
        $chartOfAccounts = ChartOfAccount::orderBy('id')->get();

        return view('contract_settings.create', compact('chartOfAccounts'));
    }

    // ─── Store ───────────────────────────────────────────────────────────────────

    public function store(Request $request)
    {
        $request->validate([
            'coa_expense_dr_id' => 'required|exists:chart_of_accounts,id',
            'coa_payable_cr_id' => 'required|exists:chart_of_accounts,id',
            'unloading'         => 'required|numeric|min:0',
            'loading'           => 'required|numeric|min:0',
            'bag_cutting'       => 'required|numeric|min:0',
            'wanda_production'  => 'required|numeric|min:0',
            'unload_refill'     => 'required|numeric|min:0',
            'packing'           => 'required|numeric|min:0',
            'shifting'          => 'required|numeric|min:0',
        ]);

        ContractSetting::create($request->only([
            'coa_expense_dr_id',
            'coa_payable_cr_id',
            'unloading',
            'loading',
            'bag_cutting',
            'wanda_production',
            'unload_refill',
            'packing',
            'shifting',
        ]));

        return redirect()->route('contract-settings.index')
            ->with('success', 'Contract setting created successfully.');
    }

    // ─── Show ────────────────────────────────────────────────────────────────────

    public function show(ContractSetting $contractSetting)
    {
        return redirect()->route('contract-settings.index');
    }

    // ─── Edit ────────────────────────────────────────────────────────────────────

    public function edit(ContractSetting $contractSetting)
    {
        $chartOfAccounts = ChartOfAccount::orderBy('id')->get();

        return view('contract_settings.edit', compact('contractSetting', 'chartOfAccounts'));
    }

    // ─── Update ──────────────────────────────────────────────────────────────────

    public function update(Request $request, ContractSetting $contractSetting)
    {
        $request->validate([
            'coa_expense_dr_id' => 'required|exists:chart_of_accounts,id',
            'coa_payable_cr_id' => 'required|exists:chart_of_accounts,id',
            'unloading'         => 'required|numeric|min:0',
            'loading'           => 'required|numeric|min:0',
            'bag_cutting'       => 'required|numeric|min:0',
            'wanda_production'  => 'required|numeric|min:0',
            'unload_refill'     => 'required|numeric|min:0',
            'packing'           => 'required|numeric|min:0',
            'shifting'          => 'required|numeric|min:0',
        ]);

        $contractSetting->update($request->only([
            'coa_expense_dr_id',
            'coa_expense_cr_id',
            'unloading',
            'loading',
            'bag_cutting',
            'wanda_production',
            'unload_refill',
            'packing',
            'shifting',
        ]));

        return redirect()->route('contract-settings.index')
            ->with('success', 'Contract setting updated successfully.');
    }

    // ─── Destroy ─────────────────────────────────────────────────────────────────

    public function destroy(ContractSetting $contractSetting)
    {
        $contractSetting->delete();

        return redirect()->route('contract-settings.index')
            ->with('success', 'Contract setting deleted successfully.');
    }
}
